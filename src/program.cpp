#include <iostream>

extern "C" { 
    int add(int a, int b);
} 

int main() {
    std::cout << add(2, 3) << std::endl;
}
