#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define MAX_SIZE 100

int arr[MAX_SIZE];

typedef struct
{
    int start_index;
    int end_index;
} array_range_t;

void merge(int arr[], int l, int m, int r)
{
    int n1 = m - l + 1;
    int n2 = r - m;

    int L[n1], R[n2];

    for (int i = 0; i < n1; i++)
        L[i] = arr[l + i];
    for (int j = 0; j < n2; j++)
        R[j] = arr[m + 1 + j];

    int i = 0, j = 0, k = l;

    while (i < n1 && j < n2)
    {
        if (L[i] <= R[j])
        {
            arr[k] = L[i];
            i++;
        }
        else
        {
            arr[k] = R[j];
            j++;
        }
        k++;
    }

    while (i < n1)
    {
        arr[k] = L[i];
        i++;
        k++;
    }

    while (j < n2)
    {
        arr[k] = R[j];
        j++;
        k++;
    }
}

void* merge_sort(void* arg)
{
    array_range_t* range = (array_range_t*) arg;
    int start_index = range->start_index;
    int end_index = range->end_index;

    if (start_index >= end_index)
    {
        pthread_exit(NULL);
    }

    int mid_index = (start_index + end_index) / 2;

    array_range_t left_range = {start_index, mid_index};
    array_range_t right_range = {mid_index + 1, end_index};

    pthread_t left_thread;
    pthread_t right_thread;

    pthread_create(&left_thread, NULL, merge_sort, &left_range);
    pthread_create(&right_thread, NULL, merge_sort, &right_range);

    pthread_join(left_thread, NULL);
    pthread_join(right_thread, NULL);

    merge(arr, start_index, mid_index, end_index);

    pthread_exit(NULL);
}

int main()
{
    int n;
    printf("Enter the number of elements: ");
    scanf("%d", &n);

    printf("Enter the elements: ");
    for (int i = 0; i < n; i++)
        scanf("%d", &arr[i]);

    array_range_t range = {0, n - 1};

    pthread_t thread;
    pthread_create(&thread, NULL, merge_sort, &range);
    pthread_join(thread, NULL);

    printf("Sorted array: ");
    for (int i = 0; i < n; i++)
        printf("%d ", arr[i]);

    printf("\n");

    return 0;
}
