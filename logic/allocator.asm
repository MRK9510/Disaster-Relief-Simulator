

.text
.globl allocate_supplies

allocate_supplies:
    push($ra)
    print_str(msg_alloc)   

    lw $s1, total_food_available    
    lw $s2, total_meds_available   
    
    lw $s0, current_region_count
    li $t0, 0                      

allocation_loop:
    beq $t0, $s0, allocation_done  
    
    sll $t1, $t0, 2

    # 1. FOOD ALLOCATION 
    lw $t2, region_populations($t1) 
    
    blez $s1, food_empty            
    
    bge $s1, $t2, full_food        
    
    # Partial Food Allocation
    sw $s1, food_allocated($t1)    
    sub $t3, $t2, $s1               
    sw $t3, unmet_demand($t1)
    li $s1, 0                       
    j meds_logic

full_food:
    sw $t2, food_allocated($t1)    
    sub $s1, $s1, $t2              
    sw $zero, unmet_demand($t1)     
    j meds_logic

food_empty:
    sw $zero, food_allocated($t1)
    sw $t2, unmet_demand($t1)       

# 2. MEDICAL ALLOCATION 
meds_logic:
    lw $t2, region_populations($t1)
    li $t4, 10
    div $t2, $t4
    mflo $t5                        

    blez $s2, meds_empty
    bge $s2, $t5, full_meds
    
    # Partial Meds
    sw $s2, meds_allocated($t1)
    li $s2, 0
    j next_region

full_meds:
    sw $t5, meds_allocated($t1)
    sub $s2, $s2, $t5
    j next_region

meds_empty:
    sw $zero, meds_allocated($t1)

next_region:
    addi $t0, $t0, 1
    j allocation_loop

allocation_done:
    sw $s1, total_food_available
    sw $s2, total_meds_available

    pop($ra)
    jr $ra
