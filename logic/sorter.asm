.text
.globl sort_regions
sort_regions:
    push($ra)
    print_str(msg_sort)    

    lw $s0, current_region_count
    ble $s0, 1, sort_done  

    #SELECTION SORT 
    li $t0, 0               
    sub $s1, $s0, 1         

outer_loop:
    beq $t0, $s1, sort_done
    
    move $t2, $t0           
    addi $t1, $t0, 1        

inner_loop:
    beq $t1, $s0, swap_elements
    
    sll $t3, $t1, 2         
    sll $t4, $t2, 2         
    
    lw $t5, region_priority($t3)   
    lw $t6, region_priority($t4)   
    
    bgt $t5, $t6, update_max
    j next_inner

update_max:
    move $t2, $t1

next_inner:
    addi $t1, $t1, 1
    j inner_loop

swap_elements:
    beq $t2, $t0, next_outer

    sll $t3, $t0, 2         
    sll $t4, $t2, 2   

    lw $t7, region_priority($t3)
    lw $t8, region_priority($t4)
    sw $t8, region_priority($t3)
    sw $t7, region_priority($t4)

    # 2. Swap ID
    lw $t7, region_ids($t3)
    lw $t8, region_ids($t4)
    sw $t8, region_ids($t3)
    sw $t7, region_ids($t4)

    # 3. Swap Population
    lw $t7, region_populations($t3)
    lw $t8, region_populations($t4)
    sw $t8, region_populations($t3)
    sw $t7, region_populations($t4)

next_outer:
    addi $t0, $t0, 1
    j outer_loop

sort_done:
    pop($ra)
    jr $ra
