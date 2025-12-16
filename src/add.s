.text
    .globl add
    .type add, @function
add:
    movl    %edi, %eax   # move first int arg (in %edi) into return reg %eax
    addl    %esi, %eax   # add second int arg (in %esi) to %eax
    ret                  # return; caller continues