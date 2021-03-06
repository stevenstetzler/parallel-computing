// This program simulates the flow of heat through a two-dimensional plate.
// The number of grid cells used to model the plate as well as the number of
//  iterations to simulate can be specified on the command-line as follows:
//  ./heated_plate_sequential <columns> <rows> <iterations>
// For example, to execute with a 500 x 500 grid for 250 iterations, use:
//  ./heated_plate_sequential 500 500 250

#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <mpi.h>
#include <math.h>

// Define the immutable boundary conditions and the inital cell value
#define TOP_BOUNDARY_VALUE 0.0
#define BOTTOM_BOUNDARY_VALUE 100.0
#define LEFT_BOUNDARY_VALUE 0.0
#define RIGHT_BOUNDARY_VALUE 100.0
#define INITIAL_CELL_VALUE 50.0
//#define hotSpotRow 4500
//#define hotSpotCol 6500
#define hotSpotRow 5
#define hotSpotCol 5
#define hotSpotTemp 100.0

// Function prototypes
void print_cells(float **cells, int n_x, int n_y);
void initialize_cells(float **cells, int n_x, int n_y);
void create_snapshot(float **cells, int n_x, int n_y, int id);
float **allocate_cells(int n_x, int n_y);
void die(const char *error);

typedef struct args {
    int start_row;
    int start_col;
    int end_row;
    int end_col;
    int num_rows;
    int num_cols;
    int thread_id;
    int iterations;
    float*** plate;
    pthread_barrier_t* update_barrier;
} args;

int make_movie = 0;
pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;
int curr_iter = 0;

void* parallel_code(void* p) { 
    args* t_args = (struct args*) p;
    
    float*** cells = t_args->plate;

    int t, y, x;
    int next_cells_index = 1;
    int curr_cells_index = 0;

    printf("Thread %d, start_row = %d, end_row = %d, start_col = %d, end_col = %d\n", t_args->thread_id, t_args->start_row, t_args->end_row, t_args->start_col, t_args->end_col);
    // Simulate the heat flow for the specified number of iterations
	for (t = 0; t < t_args->iterations; t++) {
		// Traverse the plate, computing the new value of each cell
		for (y = t_args->start_row; y <= t_args->end_row; y++) {
			for (x = t_args->start_col; x <= t_args->end_col; x++) {
				// The new value of this cell is the average of the old values of this cell's four neighbors
				// printf("Thread %d updating (%d, %d) = %f\n", t_args->thread_id, y, x, cells[next_cells_index][y][x]);
                cells[next_cells_index][y][x] = (cells[curr_cells_index][y][x - 1]  +
				                                 cells[curr_cells_index][y][x + 1]  +
				                                 cells[curr_cells_index][y - 1][x]  +
				                                 cells[curr_cells_index][y + 1][x]) * 0.25;
				// printf("Thread %d updated (%d, %d) to %f\n", t_args->thread_id, y, x, cells[next_cells_index][y][x]);
            }
		}
		
        pthread_barrier_wait(t_args->update_barrier);
		// printf("Thread %d starting up again.\n", t_args->thread_id);

        // Swap the two arrays
		curr_cells_index = next_cells_index;
		next_cells_index = !curr_cells_index;

        if (hotSpotRow <= t_args->num_rows && hotSpotCol <= t_args->num_cols) {
		    cells[curr_cells_index][hotSpotRow][hotSpotCol] = hotSpotTemp;
        }

        if (make_movie == 1) {
            // First thread that gets to this creates a snapshot at current iter, increments iter
            pthread_mutex_lock(&mutex1);

            if (curr_iter == t) {
                printf("Thread %d, curr_iter = %d, t = %d\n", t_args->thread_id, curr_iter, t);
                create_snapshot(cells[curr_cells_index], t_args->num_cols, t_args->num_rows, curr_iter);
                curr_iter += (t_args->iterations > 100) ? t_args->iterations / 100 : 1;
                printf("Thread %d, Update: curr_iter = %d, t = %d\n", t_args->thread_id, curr_iter, t);
            }

            pthread_mutex_unlock(&mutex1);
        }

        pthread_barrier_wait(t_args->update_barrier);
		// printf("Thread %d starting up again.\n", t_args->thread_id);
        
        // Print the current progress
		// printf("Thread: %d, Iteration: %d / %d\n", t_args->thread_id, t + 1, t_args->iterations);
	}
    
}

int power_of_four(unsigned int x) {
    if (x == 0) 
        return 0;
    if (x & (x - 1))
        return 0;
    return x & 0x55555555;
}

int main(int argc, char **argv) {
	// Record the start time of the program
	time_t start_time = time(NULL);
	
	// Extract the input parameters from the command line arguments
	// Number of columns in the grid (default = 1,000)
	int num_cols = (argc > 1) ? atoi(argv[1]) : 1000;
	// Number of rows in the grid (default = 1,000)
	int num_rows = (argc > 2) ? atoi(argv[2]) : 1000;
	// Number of iterations to simulate (default = 100)
	int iterations = (argc > 3) ? atoi(argv[3]) : 100;
    // Number of threads to use
    unsigned int num_threads = (argc > 4) ? atoi(argv[4]) : 1;
    int process_layout = (argc > 5) ? atoi(argv[5]) : 0;
    // Whether or not to make a movie
    make_movie = (argc > 6) ? atoi(argv[6]) : 0;

	// Output the simulation parameters
	printf("Grid: %dx%d, Iterations: %d, Threads: %d, Movie: %d \n", num_cols, num_rows, iterations, num_threads, make_movie);
		
	// We allocate two arrays: one for the current time step and one for the next time step.
	// At the end of each iteration, we switch the arrays in order to avoid copying.
	// The arrays are allocated with an extra surrounding layer which contains
	//  the immutable boundary conditions (this simplifies the logic in the inner loop).
	float **cells[2];
	cells[0] = allocate_cells(num_cols + 2, num_rows + 2);
	cells[1] = allocate_cells(num_cols + 2, num_rows + 2);
	int curr_cells_index = 0, next_cells_index = 1;
	
	// Initialize the interior (non-boundary) cells to their initial value.
	// Note that we only need to initialize the array for the current time
	//  step, since we will write to the array for the next time step
	//  during the first iteration.
	initialize_cells(cells[0], num_cols, num_rows);
	
	// Set the immutable boundary conditions in both copies of the array
	int x, y, i;
	for (x = 1; x <= num_cols; x++) cells[0][0][x] = cells[1][0][x] = TOP_BOUNDARY_VALUE;
	for (x = 1; x <= num_cols; x++) cells[0][num_rows + 1][x] = cells[1][num_rows + 1][x] = BOTTOM_BOUNDARY_VALUE;
	for (y = 1; y <= num_rows; y++) cells[0][y][0] = cells[1][y][0] = LEFT_BOUNDARY_VALUE;
	for (y = 1; y <= num_rows; y++) cells[0][y][num_cols + 1] = cells[1][y][num_cols + 1] = RIGHT_BOUNDARY_VALUE;

    // Create a set of threads

    pthread_t threadpool[num_threads];
    args arguments[num_threads];

    pthread_attr_t attr;
    pthread_attr_init(&attr);

    pthread_barrier_t update_barrier;
    pthread_barrier_init(&update_barrier, NULL, num_threads);
    
    int divisions = (int) sqrt(num_threads);
    if (process_layout == 3) {
        divisions = num_rows / 100;
    }
    int j = 0;

    int necessary_subproblems = (2 * num_rows * num_cols * 32) / (2048 * 1024);

    // Define scheme for assigning which work each thread will take
    for (i = 0; i < num_threads; i++) {
        switch (process_layout) {
            case 0 :
                // Assign each thread an equal number of rows to work with
                arguments[i].start_row = (int) (num_rows / (float) num_threads * i) + 1;
                arguments[i].end_row = (int) (num_rows / (float) num_threads * (i + 1));
                arguments[i].start_col = 1;
                arguments[i].end_col = num_cols;
                break;
            case 1 :
                // Assign each thread an equal number of columns to work with
                arguments[i].start_row = 1;
                arguments[i].end_row = num_rows;
                arguments[i].start_col = (int) (num_cols / (float) num_threads * i) + 1;
                arguments[i].end_col = (int) (num_cols / (float) num_threads * (i + 1));
                break;
            case 2 :
                // Block into squares
                if (!power_of_four(num_threads)) {
                    printf("num_threads = %d is not a power of four. Cannot block into squares.\n", num_threads);
                    return 1;
                }
                if (i % divisions == 0 && i != 0) {
                    j += 1;
                }
                arguments[i].start_row = (int) (num_rows / (float) divisions * (i % divisions)) + 1;
                arguments[i].end_row = (int) (num_rows / (float) divisions * ((i % divisions) + 1));
                arguments[i].start_col = (int) (num_cols / (float) divisions * j) + 1;
                arguments[i].end_col = (int) (num_cols / (float) divisions * (j + 1));
                //printf("Thread %d, start_row %d, end_row %d, start_col %d, end_col %d\n", i, arguments[i].start_row, arguments[i].end_row, arguments[i].start_col, arguments[i].end_col);
                
                break;
            case 3 :
                // Block into cache sized squares
                if (i % divisions == 0 && i != 0) {
                    j += 1;
                }
                arguments[i].start_row = (int) (num_rows / (float) divisions * (i % divisions)) + 1;
                arguments[i].end_row = (int) (num_rows / (float) divisions * ((i % divisions) + 1));
                arguments[i].start_col = (int) (num_cols / (float) divisions * j) + 1;
                arguments[i].end_col = (int) (num_cols / (float) divisions * (j + 1));
                //printf("Thread %d, start_row %d, end_row %d, start_col %d, end_col %d\n", i, arguments[i].start_row, arguments[i].end_row, arguments[i].start_col, arguments[i].end_col);
                
                break;
        }

        arguments[i].thread_id = i;
        arguments[i].iterations = iterations;
        arguments[i].plate = cells;
        arguments[i].update_barrier = &update_barrier;
        arguments[i].num_rows = num_rows;
        arguments[i].num_cols = num_cols;
    }

    //return 0;

    for (i = 0; i < num_threads; i++) {
        printf("Starting thread %d.\n", i);
        // Create each thread, passing thread attributes, the function to run, and the arguments to use
        pthread_create(&threadpool[i], &attr, &parallel_code, (void *) &arguments[i]);
    }

    for (i = 0; i < num_threads; i++) {
        pthread_join(threadpool[i], NULL);
    }

	// Output a snapshot of the final state of the plate
	int final_cells = (iterations % 2 == 0) ? 0 : 1;
	//create_snapshot(cells[final_cells], num_cols, num_rows, iterations);

	// Compute and output the execution time
	time_t end_time = time(NULL);
	printf("\nExecution time: %f seconds\n", difftime(end_time, start_time));
	
	return 0;
}


// Allocates and returns a pointer to a 2D array of floats
float **allocate_cells(int num_cols, int num_rows) {
	// Initialize array of float pointers -- array of arrays
    float **array = (float **) malloc(num_rows * sizeof(float *));
	if (array == NULL) die("Error allocating array!\n");
	
    // Initialize first pointer to point to beginning of flattened array of size num_rows x num_cols
	array[0] = (float *) malloc(num_rows * num_cols * sizeof(float));
	if (array[0] == NULL) die("Error allocating array!\n");

    // Initialize each row to point to a portion of the flattened array that is of size num_cols
	int i;
	for (i = 1; i < num_rows; i++) {
		array[i] = array[0] + (i * num_cols);
	}

	return array;
}


// Sets all of the specified cells to their initial value.
// Assumes the existence of a one-cell thick boundary layer.
void initialize_cells(float **cells, int num_cols, int num_rows) {
	int x, y;
	for (y = 1; y <= num_rows; y++) {
		for (x = 1; x <= num_cols; x++) {
			cells[y][x] = INITIAL_CELL_VALUE;
		}
	}
}


// Creates a snapshot of the current state of the cells in PPM format.
// The plate is scaled down so the image is at most 1,000 x 1,000 pixels.
// This function assumes the existence of a boundary layer, which is not
//  included in the snapshot (i.e., it assumes that valid array indices
//  are [1..num_rows][1..num_cols]).
void create_snapshot(float **cells, int num_cols, int num_rows, int id) {
	int scale_x, scale_y;
	scale_x = scale_y = 1;
	
	// Figure out if we need to scale down the snapshot (to 1,000 x 1,000)
	//  and, if so, how much to scale down
	if (num_cols > 1000) {
		if ((num_cols % 1000) == 0) scale_x = num_cols / 1000;
		else {
			die("Cannot create snapshot for x-dimensions >1,000 that are not multiples of 1,000!\n");
			return;
		}
	}
	if (num_rows > 1000) {
		if ((num_rows % 1000) == 0) scale_y = num_rows / 1000;
		else {
			printf("Cannot create snapshot for y-dimensions >1,000 that are not multiples of 1,000!\n");
			return;
		}
	}
	
	// Open/create the file
	char text[255];
	sprintf(text, "snapshot_parallel.%06d.ppm", id);
	FILE *out = fopen(text, "w");
	// Make sure the file was created
	if (out == NULL) {
		printf("Error creating snapshot file!\n");
		return;
	}
	
	// Write header information to file
	// P3 = RGB values in decimal (P6 = RGB values in binary)
	fprintf(out, "P3 %d %d 100\n", num_cols / scale_x, num_rows / scale_y);
	
	// Precompute the value needed to scale down the cells
	float inverse_cells_per_pixel = 1.0 / ((float) scale_x * scale_y);
	
	// Write the values of the cells to the file
	int x, y, i, j;
	for (y = 1; y <= num_rows; y += scale_y) {
		for (x = 1; x <= num_cols; x += scale_x) {
			float sum = 0.0;
			for (j = y; j < y + scale_y; j++) {
				for (i = x; i < x + scale_x; i++) {
					sum += cells[j][i];
				}
			}
			// Write out the average value of the cells we just visited
			int average = (int) (sum * inverse_cells_per_pixel);
			// printf("%d 0 %d\t", average, 100 - average);
			fprintf(out, "%d 0 %d\t", average, 100 - average);
		}
        // printf("\n");
		fwrite("\n", sizeof(char), 1, out);
	}
	
	// Close the file
	fclose(out);
}


// Prints the specified error message and then exits
void die(const char *error) {
	printf("%s", error);
	exit(1);
}
