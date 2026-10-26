.text
.globl calculate_priorities

calculate_priorities:
    push($ra)
    print_str(msg_calc)  

    li $t0, 0              
    lw $s0, current_region_count

calc_loop:
    beq $t0, $s0, calc_done 

    sll $t1, $t0, 2        
    
    # 1. Severity Contribution
    lw  $t2, region_severity($t1)
    li  $t3, WEIGHT_SEVERITY
    mul $t4, $t2, $t3      

    # 2. Population Contribution
    lw  $t2, region_populations($t1)
    li  $t3, WEIGHT_POPULATION
    mul $t5, $t2, $t3       
    add $t4, $t4, $t5       

    # 3. Vulnerability Contribution
    lw  $t2, region_vulnerability($t1)
    li  $t3, WEIGHT_VULNERABILITY
    mul $t5, $t2, $t3       
    add $t4, $t4, $t5       

    # 4. Distance Penalty 
    lw  $t2, region_distance($t1)
    li  $t3, WEIGHT_DISTANCE
    mul $t5, $t2, $t3       
    sub $t4, $t4, $t5       

    # RESULT 
    bgezal $t4, skip_clamp  
    li $t4, 0              
skip_clamp:
    sw $t4, region_priority($t1)

    # Increment counter
    addi $t0, $t0, 1
    j calc_loop

calc_done:
    pop($ra)
    jr $ra
