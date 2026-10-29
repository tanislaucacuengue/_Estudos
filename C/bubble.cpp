#include <stdio.h>

void bubbleSort(int vetor[], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (vetor[j] > vetor[j + 1]) {
                int auxiliar = vetor[j];
                vetor[j] = vetor[j + 1];
                vetor[j + 1] = auxiliar;
            }
        }
    }
}

int main() {
    int vetor[] = {1, 3, 2, 4, 8, 6, 5, 7, 9, 0};
    int n = sizeof(vetor) / sizeof(vetor[0]);

    bubbleSort(vetor, n);

    for (int i = 0; i < n; i++) {
        printf("%d%s", vetor[i], i == n - 1 ? "\n" : " - ");
    }
    return 0;
}
