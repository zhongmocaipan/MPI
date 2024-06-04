#include <iostream>
#include <vector>
#include <mpi.h>

#define MATRIX_SIZE 900 // 宏定义矩阵规模

// 定义多项式类型
struct Polynomial {
    std::vector<double> coefficients;
};

// 高斯消元算法
void gaussian_elimination(std::vector<Polynomial>& equations, int start, int end) {
    for (unsigned int i = start; i < end; ++i) {
        for (unsigned int j = i + 1; j < equations.size(); ++j) {
            double factor = equations[j].coefficients[i] / equations[i].coefficients[i];
            for (unsigned int k = i; k < equations.size(); ++k) {
                equations[j].coefficients[k] -= factor * equations[i].coefficients[k];
            }
        }
    }
}

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);
    int rank, size;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    // 每个进程的方程数
    int num_equations_per_process = 10;
    // 总的方程数
    int total_num_equations = num_equations_per_process * size;

    // 创建方程组
    std::vector<Polynomial> equations(total_num_equations);
    for (int i = 0; i < total_num_equations; ++i) {
        equations[i].coefficients.resize(total_num_equations + 1);
        for (int j = 0; j <= total_num_equations; ++j) {
            equations[i].coefficients[j] = i + j;
        }
    }

    // 广播方程组
    for (int i = 0; i < total_num_equations; ++i) {
        MPI_Bcast(equations[i].coefficients.data(), total_num_equations + 1, MPI_DOUBLE, 0, MPI_COMM_WORLD);
    }

    // 记录开始时间
    double start_time = MPI_Wtime();

    // 计算每个进程处理的范围
    int start = rank * num_equations_per_process;
    int end = start + num_equations_per_process;

    // 进行高斯消元
    gaussian_elimination(equations, start, end);

    // 记录结束时间
    double end_time = MPI_Wtime();
    double elapsed_time = end_time - start_time;

    // 进程0输出总运行时间
    if (rank == 0) {
        std::cout << "Elapsed time: " << elapsed_time << " seconds" << std::endl;
    }

    MPI_Finalize();
    return 0;
}
