#include <iostream>
#include <vector>
#include <cstdlib>
#include <ctime>
#include <mpi.h>

#define MATRIX_SIZE 4 // 宏定义矩阵大小

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

	// 打印初始化矩阵（仅用于调试）
	if (rank == 0) {
		cout << "Initial matrix:" << endl;
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				cout << matrix[i * n + j] << " ";
			}
			cout << endl;
		}
	}

	mpi_gaussian_elimination(matrix.data(), n, rank, size);

	// 打印处理后的矩阵（仅用于调试）
	if (rank == 0) {
		cout << "Matrix after Gaussian elimination:" << endl;
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				cout << matrix[i * n + j] << " ";
			}
			cout << endl;
		}
	}

	MPI_Finalize();
	return 0;
}
