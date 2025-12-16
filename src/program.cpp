#include <iostream>

extern "C" { 
    int add(int a, int b);

    int multiply(int a, int b);
}

int main(int argc, char** argv) {
    if (argc != 3) {
        return 1;
    }

    try {
        int arg1 = std::stoi(argv[1]);
        int arg2 = std::stoi(argv[2]);

        std::cout << "Calling Assembly code => " << arg1 << " + " << arg2 << " = " << add(arg1, arg2) << std::endl;
        std::cout << "Calling Assembly code => " << arg1 << " * " << arg2 << " = " << multiply(arg1, arg2) << std::endl; 
    } catch (const std::exception&) {
        std::cout << "Parse error ocurred" << std::endl;
        return 2;
    }    
}
