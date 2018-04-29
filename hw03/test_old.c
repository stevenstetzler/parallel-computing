#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX_COL 500
#define MAX_ROW 100000

typedef struct args {
    int startrow;
    int startcol;
    int endrow;
    int endcol;
    int thread_id;
    double* data;
    double* data_next;
} args;

// all the work goes here (averaging + setting values)
void* my_parallel_function(void* arg) {
    args* thread_args = (struct args*) arg;
    //printf("startrow: %d \n", thread_args->startrow);
    //printf("startcol: %d \n", thread_args->startcol);
    //printf("endrow: %d \n", thread_args->endrow);
    //printf("endcol: %d \n", thread_args->endcol);
    //printf("thread_id: %d \n", thread_args->thread_id);
    //printf("data: %f \n", thread_args->data[0]);
    //printf("data_next: %f \n", thread_args->data_next[0]);

    double* next = thread_args->data_next;
    double* now = thread_args->data;

    int i, j, left, center, right;
    for (i = thread_args->startrow; i < thread_args->endrow; i++) {
        //printf("Thread %d working on %d\n", thread_args->thread_id, i);
        //printf("left = %f, center = %f, right = %f\n", now[i - 1], now[i], now[i + 1]);
        left = (i - 1) % MAX_ROW;
        if (left < 0) {
            left += MAX_ROW;
        }
        right = (i + 1) % MAX_ROW;
        if (right < 0) {
            right += MAX_ROW;
        }
        next[i] = 1./3. * (now[left] + now[i] + now[right]);
    }
}

int main(int argc, char* argv[]) {
    // get from command line
    int num_threads = atoi(argv[1]);

    args arguments[num_threads];
    
    // Important!
    // For now, sets to default values, but lets you tweak 
    pthread_attr_t attr;
    pthread_attr_init(&attr);

    pthread_t threadpool[num_threads];

    double my_array[MAX_ROW] = {1};
    double my_array2[MAX_ROW] = {0};

    int i;
    for (i = 0; i < MAX_ROW; i++) {
        my_array[i] = i % 10;
        my_array2[i] = 0;
    }

    // Set up our arguments for each thread
    for (i = 0; i < num_threads; i++) {
        arguments[i].startrow = (int) (MAX_ROW / (float) num_threads * i);
        arguments[i].startcol = (int) (MAX_COL / (float) num_threads * i);
        arguments[i].endrow = (int) (MAX_ROW / (float) num_threads * (i + 1));
        arguments[i].endcol = (int) (MAX_COL / (float) num_threads * (i + 1));
        arguments[i].thread_id = threadpool[i];
        arguments[i].data = my_array;
        arguments[i].data_next = my_array2;
    }

    // Unleash
    for (i = 0; i < num_threads; i++) {
        printf("Starting thread %d with id %d\n", i, (int) threadpool[i]);
        pthread_create(&threadpool[i], &attr, &my_parallel_function, (void *) &arguments[i]);
    }
    // Join all threads
    for (i = 0; i < num_threads; i++) {
        pthread_join(threadpool[i], NULL);
    }

    // Print out the new data
    for (i = 0; i < MAX_ROW; i++) {
       // printf("%f ", my_array2[i]);
    }
    //printf("\n");

}
