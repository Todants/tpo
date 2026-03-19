#include <iostream>
#include <string>
#include <cstdio>
#include <memory>
#include <stdexcept>
#include <array>

using namespace std;

int runTest(string name, string input, string expect) {
    string command = "echo \"" + input + "\" | ../fib";
    array<char, 128> buffer;
    string result;
    unique_ptr<FILE, decltype(&pclose)> pipe(popen(command.c_str(), "r"), pclose);
    if (!pipe) {
        throw runtime_error("popen failed");
    }
    while (fgets(buffer.data(), buffer.size(), pipe.get()) != nullptr) {
        result += buffer.data();
    }
    // Удаляем перевод строки, если есть
    if (!result.empty() && result.back() == '\n')
        result.pop_back();
    if (result == expect) {
        cout << name << " passed" << endl;
        return 0;
    } else {
        cout << name << " failed: expected '" << expect << "', got '" << result << "'" << endl;
        return 1;
    }
}

int main() {
    int failed = 0;
    failed += runTest("test1", "0", "0");
    failed += runTest("test2", "1", "1");
    failed += runTest("test3", "10", "55");
    failed += runTest("test4", "15", "610");
    return failed;
}
