.macro print_str(%str_label)
    li      $v0, 4             
    la      $a0, %str_label     
    syscall
.end_macro

.macro print_int(%register)
    li      $v0, 1              
    move    $a0, %register      
    syscall
.end_macro

.macro print_char(%char_immediate)
    li      $v0, 11             
    li      $a0, %char_immediate
    syscall
.end_macro

.macro print_newline
    li      $v0, 11
    li      $a0, 10             
    syscall
.end_macro

.macro print_tab
    li      $v0, 11
    li      $a0, 9              
    syscall
.end_macro

# 2. INPUT
.macro read_int(%dest_register)
    li      $v0, 5             
    syscall
    move    %dest_register, $v0 
.end_macro

# 3. STACK 
.macro push(%register)
    subu    $sp, $sp, 4    
    sw      %register, ($sp)   
.end_macro

.macro pop(%register)
    lw      %register, ($sp)    
    addu    $sp, $sp, 4         
.end_macro

# 4. Exit
.macro exit_program
    li      $v0, 10             
    syscall
.end_macro
