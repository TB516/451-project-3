.text
    .global multiply
    .type multiply, @function
multiply:
    movl    %edi, %eax   # move first int arg (in %edi) into return reg %eax
    imull   %esi, %eax   # multiply second int arg (in %esi) with the value in return registry
    ret                  # return; caller continues