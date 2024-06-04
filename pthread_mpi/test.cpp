#include <iostream>
#include <vector>
#include <cstdlib>
#include <ctime>
#include <pthread.h>
#include <mpi.h>

#define MATRIX_SIZE 9000 // 宏定义矩阵大小
#define NUM_THREADS 2 // 宏定义每个进程的线程数

using namespace std;

struct ThreadData {
    double* matrix;
    int n;
    int thread_id;
    int num_threads;
};

void* pthread_gaussian_elimination(void* thread_arg) {
    ThreadData* data = (ThreadData*)thread_arg;
    double* matrix = data->matrix;
    int n = data->n;
    int thread_id = data->thread_id;
    int num_threads = data->num_threads;

    for (int k = 0; k < n; k++) {
        if (thread_id == k % num_threads) {
            for (int j = k + 1; j < n; j++) {
                matrix[k * n + j] /= matrix[k * n + k];
            }
            matrix[k * n + k] = 1.0;
        }

        for (int i = k + 1; i < n; i++) {
            if (thread_id == i % num_threads) {
                for (int j = k + 1; j < n; j++) {
                    matrix[i * n + j] -= matrix[i * n + k] * matrix[k * n + j];
                }
                matrix[i * n + k] = 0.0;
            }
        }
    }

    pthread_exit(NULL);
}

int main(int argc, char* argv[]) {
    MPI_Init(&argc, &argv);

    int rank, size;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    int n = MATRIX_SIZE;
    vector<double> matrix(n * n);

    // 初始化随机数生成器
    srand(time(0) + rank);

    // 生成随机矩阵
    for (int i = 0; i < n * n; i++) {
        matrix[i] = static_cast<double>(rand()) / RAND_MAX * 10.0; // 生成0到10之间的随机数
    }

    // 记录开始时间
    double start_time = MPI_Wtime();

    pthread_t threads[NUM_THREADS];
    ThreadData thread_data[NUM_THREADS];

    for (int i = 0; i < NUM_THREADS; i++) {
        thread_data[i].matrix = matrix.data();
        thread_data[i].n = n;
        thread_data[i].thread_id = i;
        thread_data[i].num_threads = NUM_THREADS;
        pthread_create(&threads[i], NULL, pthread_gaussian_elimination, (void*)&thread_data[i]);
    }

    for (int i = 0; i < NUM_THREADS; i++) {
        pthread_join(threads[i], NULL);
    }

    // 记录结束时间
    double end_time = MPI_Wtime();

    // 输出执行时间
    if (rank == 0) {
        cout << "Execution time: " << end_time - start_time << " seconds." << endl;
    }

    MPI_Finalize();
    return 0;
}
