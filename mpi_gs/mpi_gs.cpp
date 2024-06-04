#include <iostream>
#include <vector>
#include <cstdlib>
#include <ctime>
#include <mpi.h>

#define MATRIX_SIZE 9000 // 宏定义矩阵大小

using namespace std;

// MPI版本的高斯消去法
void mpi_gaussian_elimination(double* A, int n, int rank, int size) {
    int i, j, k;
    for (k = 0; k < n; k++) {
        // 进行行间同步，确保每个进程在处理同一列时拥有最新的数据
        MPI_Bcast(&A[k * n], n, MPI_DOUBLE, k % size, MPI_COMM_WORLD);

        // 主进程进行消元操作
        if (rank == k % size) {
            for (j = k + 1; j < n; j++) {
                A[k * n + j] /= A[k * n + k];
            }
            A[k * n + k] = 1.0;
        }

        // 广播消元后的主行
        MPI_Bcast(&A[k * n], n, MPI_DOUBLE, k % size, MPI_COMM_WORLD);

        // 其他进程消去当前行
        for (i = k + 1; i < n; i++) {
            if (rank == i % size) {
                for (j = k + 1; j < n; j++) {
                    A[i * n + j] -= A[i * n + k] * A[k * n + j];
                }
                A[i * n + k] = 0.0;
            }
        }
    }
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

    // 开始计时
    double start_time = MPI_Wtime();

    mpi_gaussian_elimination(matrix.data(), n, rank, size);

    // 结束计时
    double end_time = MPI_Wtime();
    double elapsed_time = end_time - start_time;

    // 收集并打印每个进程的执行时间
    double max_time;
    MPI_Reduce(&elapsed_time, &max_time, 1, MPI_DOUBLE, MPI_MAX, 0, MPI_COMM_WORLD);

    if (rank == 0) {
        cout << "Elapsed time: " << max_time << " seconds" << endl;
    }

    MPI_Finalize();
    return 0;
}
