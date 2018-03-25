#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

typedef struct args {
    int startrow;
    int startcol;
    int endrow;
    int endcol;
    int thread_id;
    double* data;
} args;

// all the work goes here (averaging + setting values)
void* my_parallel_function(void* arg) {
    args* thread_args = (struct args*) arg;
    printf("startrow: %d \n", thread_args->startrow);
    printf("startcol: %d \n", thread_args->startcol);
    printf("endrow: %d \n", thread_args->endrow);
    printf("endcol: %d \n", thread_args->endcol);
    printf("thread_id: %d \n", thread_args->thread_id);
    printf("data: %f \n", thread_args->data[0]);
}

int main(int argc, char* argv[]) {
    // get from command line
    int num_threads = 1;

    args arguments[num_threads];
    
    int num_rows = 500;
    int num_cols = 500;
    
    // Important!
    // For now, sets to default values, but lets you tweak 
    pthread_attr_t attr;
    pthread_attr_init(&attr);

    pthread_t threadpool[num_threads];

    double my_array[200] = {1};

    for (int i = 0; i < num_threads; i++) {
        arguments[i].startrow = 0;
        arguments[i].startcol = 0;
        arguments[i].endrow = 0;
        arguments[i].endcol = 0;
        arguments[i].endcol = threadpool[i];
        arguments[i].data = my_array;
    }

    // Unleash
    for (int i = 0; i < num_threads; i++) {
        pthread_create(&threadpool[i], &attr, &my_parallel_function, (void *) &arguments[i]);
    }

}
