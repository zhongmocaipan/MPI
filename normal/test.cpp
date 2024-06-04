#include <iostream>
#include <vector>
#include <iomanip>  // For std::setprecision
#include <cstdlib>  // For srand and rand
#include <ctime>    // For time
#include <chrono>   // For measuring time

using namespace std;

#define n 9000

// 打印矩阵的函数，用于调试
void printMatrix(const vector<vector<double> >& matrix) {
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            cout << setw(10) << setprecision(5) << matrix[i][j] << " ";
        }
        cout << endl;
    }
}

// 高斯消去法的实现
void gaussianElimination(vector<vector<double> >& matrix) {
    for (int k = 0; k < n; ++k) {
        // 选取主元
        for (int j = k + 1; j < n; ++j) {
            matrix[k][j] /= matrix[k][k];
        }
        matrix[k][k] = 1.0;

        // 消去当前列
        for (int i = k + 1; i < n; ++i) {
            for (int j = k + 1; j < n; ++j) {
                matrix[i][j] -= matrix[i][k] * matrix[k][j];
            }
            matrix[i][k] = 0.0;
        }
    }
}

int main() {
    // 初始化矩阵
    vector<vector<double> > matrix(n, vector<double>(n));

    // 随机生成矩阵的元素
    srand(time(0));
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            matrix[i][j] = static_cast<double>(rand()) / RAND_MAX * 10.0; // 生成0到10之间的随机数
        }
    }


    // 记录开始时间
    auto start = chrono::high_resolution_clock::now();

    // 进行高斯消去
    gaussianElimination(matrix);

    // 记录结束时间
    auto end = chrono::high_resolution_clock::now();

    // 计算运行时间
    chrono::duration<double> elapsed = end - start;
    cout << "Time taken for Gaussian elimination: " << elapsed.count() << " seconds" << endl;

    return 0;
}
