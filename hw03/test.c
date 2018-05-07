#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

void* print_message(void* p) {
    char* message = (char*) p;
    printf("%s \n", message);
}

int main() {
    pthread_t thread_1, thread_2;

    char* message_1 = "Hello I am thread 1.";
    char* message_2 = "Hey I'm thread 2.";

    pthread_create(&thread_1, NULL, print_message_function, (void*) messsage_1);
    pthread_create(&thread_2, NULL, print_message_function, (void*) messsage_2);

    pthread_join(thread_1, NULL);
    pthread_join(thread_2, NULL);
    exit(0);
}
