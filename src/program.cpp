#include <iostream>
#include <cstddef>

extern "C" {
    int add(int a, int b);

    int multiply(int a, int b);

    void transformArray(const int* src, int* dst, std::size_t len, int factor);
}

static void demoTransform() {
    const int src[] = { 1, 2, 3, 4 };
    const std::size_t len = sizeof(src) / sizeof(src[0]);
    int dst[len];

    for (std::size_t i = 0; i < len; ++i) dst[i] = 0;

    std::cout << "Demo: transforming source array with factor 10\n";
    transformArray(src, dst, len, 10);

    std::cout << "src -> dst\n";
    for (std::size_t i = 0; i < len; ++i) {
        std::cout << src[i] << " -> " << dst[i] << '\n';
    }
    std::cout << "done (processed " << len << " elements)\n";
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
    
        std::cout << std::endl << "Demoing transform (part 3)" << std::endl << std::endl;

        demoTransform();
    } catch (const std::exception&) {
        std::cout << "Parse error occurred" << std::endl;
        return 2;
    }

    return 0;
}