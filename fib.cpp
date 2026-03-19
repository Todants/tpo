#include <iostream>
#include <cstdlib>

unsigned long long fibonacci(unsigned int n) {
    if (n == 0) return 0;
    if (n == 1) return 1;

    unsigned long long a = 0, b = 1, c;
    for (unsigned int i = 2; i <= n; ++i) {
        c = a + b;
        a = b;
        b = c;
    }
    return b;
}

int main(int argc, char* argv[]) {
    unsigned int n;

    if (argc >= 2) {
        n = std::atoi(argv[1]);
    } else {
        std::cout << "Введите n: ";
        std::cin >> n;
        if (std::cin.fail()) {
            std::cerr << "Ошибка ввода" << std::endl;
            return 1;
        }
    }

    std::cout << "F(" << n << ") = " << fibonacci(n) << std::endl;
    return 0;
}
