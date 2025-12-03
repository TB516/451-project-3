.text              # put following code in the code/text section
    .globl add     # make symbol `add` visible to the linker
    .type add, @function  # mark `add` as a function symbol (for tools/debuggers)
# int add(int a, int b) { return a + b; }   # comment
add:               # function label (entry point)
    movl    %edi, %eax   # move first int arg (in %edi) into return reg %eax
    addl    %esi, %eax   # add second int arg (in %esi) to %eax
    ret                  # return; caller continues
