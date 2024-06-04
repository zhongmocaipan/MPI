#include <iostream>
#include <vector>
#include <mpi.h>
#include <ctime>
#include <cstdlib> 

#define N 9000 // 矩阵大小

void pipeline_gaussian_elimination(std::vector<double>& matrix, int n, int rank, int size, int num_stages) {
    for (int stage = 0; stage < num_stages; ++stage) {
        int k = stage;
        while (k < n) {
            if (rank == k % size) {
                for (int j = k + 1; j < n; ++j) {
                    matrix[k * n + j] /= matrix[k * n + k];
                }
                matrix[k * n + k] = 1.0;
            }
            MPI_Bcast(&matrix[k * n], n, MPI_DOUBLE, k % size, MPI_COMM_WORLD);
            for (int i = k + 1; i < n; ++i) {
                if (rank == i % size) {
                    for (int j = k + 1; j < n; ++j) {
                        matrix[i * n + j] -= matrix[i * n + k] * matrix[k * n + j];
                    }
                    matrix[i * n + k] = 0.0;
                }
            }
            k += num_stages;
        }
    }
}

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);
    int rank, size;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    std::vector<double> matrix(N * N);

    if (rank == 0) {
        // 初始化矩阵，这里假设为随机初始化
        for (int i = 0; i < N * N; ++i) {
            matrix[i] = rand() % 100;
        }
    }

    // 广播矩阵
    MPI_Bcast(matrix.data(), N * N, MPI_DOUBLE, 0, MPI_COMM_WORLD);

    int num_stages = 10; // 流水线阶段数

    // 测量性能
    double start_time = MPI_Wtime();
    pipeline_gaussian_elimination(matrix, N, rank, size, num_stages);
    double end_time = MPI_Wtime();
    double elapsed_time = end_time - start_time;

    if (rank == 0) {
        std::cout << "Elapsed time: " << elapsed_time << " seconds" << std::endl;
    }

    MPI_Finalize();
    return 0;
}
