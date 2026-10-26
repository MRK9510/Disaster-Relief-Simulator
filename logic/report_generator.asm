.text
.globl generate_report

generate_report:
    push($ra)

    # 1. PRINT HEADERS
    print_str(msg_report_title)
    print_str(msg_table_head)
    print_str(msg_table_line)

    li $t0, 0                       
    lw $s0, current_region_count
    li $s1, 0                 
    li $s2, 0                       

report_loop:
    beq $t0, $s0, summary_section
    
    sll $t1, $t0, 2                 

    # Column 1: Region ID
    lw $t2, region_ids($t1)
    print_int($t2)
    print_tab

    # Column 2: Priority Score
    lw $t2, region_priority($t1)
    print_int($t2)
    print_tab

    # Column 3: Population
    lw $t2, region_populations($t1)
    print_int($t2)
    print_tab

    # Column 4: Food Allocated
    lw $t2, food_allocated($t1)
    print_int($t2)
    add $s1, $s1, $t2             
    print_tab

    # Column 5: Meds Allocated
    lw $t2, meds_allocated($t1)
    print_int($t2)
    print_tab

    # Column 6: Status String
    lw $t3, unmet_demand($t1)
    add $s2, $s2, $t3               
    
    # Conditional cases for Status
    beq $t3, $zero, show_full      
    lw $t4, region_populations($t1)
    beq $t3, $t4, show_none         
    j show_partial

show_full:
    print_str(status_full)
    j end_row
show_none:
    print_str(status_none)
    j end_row
show_partial:
    print_str(status_partial)

end_row:
    print_newline
    addi $t0, $t0, 1
    j report_loop

summary_section:
    print_str(msg_table_line)
    
    print_str(msg_total_dist)
    print_int($s1)         
    
    print_str(msg_unmet)
    print_int($s2)         

    #  Efficiency Calculation 
    add $t5, $s1, $s2       
    
    # Safety Check
    beq $t5, $zero, print_zero_eff

    # Calculate
    li $t6, 100
    mult $s1, $t6         
    mflo $t7              
    
    div $t7, $t5           
    mflo $t8               

    li $t9, 100
    ble $t8, $t9, print_eff
    li $t8, 100            

print_eff:
    print_str(msg_efficiency)
    print_int($t8)
    print_str(msg_percent)
    b finish_report

print_zero_eff:
    print_str(msg_efficiency)
    li $t8, 0
    print_int($t8)
    print_str(msg_percent)

finish_report:
    print_newline
    pop($ra)
    jr $ra

