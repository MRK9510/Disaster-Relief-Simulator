.text
.globl get_user_input

get_user_input:
    push($ra)               

    # 1. GLOBAL SCENARIO INPUT 
    print_str(msg_welcome)
    print_str(msg_title)
    
    print_str(prompt_disaster)
    read_int($t0)          

    print_str(prompt_regions)
    read_int($t1)
    sw $t1, current_region_count 

    print_str(prompt_food)
    read_int($t2)
    sw $t2, total_food_available

    print_str(prompt_meds)
    read_int($t3)
    sw $t3, total_meds_available

    # 2. REGIONAL DATA LOOP 
    li $t0, 0              
    lw $s0, current_region_count

region_loop:
    beq $t0, $s0, input_done 

    # Calculate memory offset: offset = i * 4
    sll $t1, $t0, 2        

    # Store Region ID (using 1-based indexing for display)
    addi $t2, $t0, 1
    sw $t2, region_ids($t1)

    # UI Header
    print_str(prompt_reg_header)
    print_int($t2)
    print_newline

    # Get Population
    print_str(prompt_pop)
    read_int($v0)           
    sw $v0, region_populations($t1)

    # Get Severity
    print_str(prompt_sev)
    read_int($v0)
    sw $v0, region_severity($t1)

    # Get Vulnerability
    print_str(prompt_vuln)
    read_int($v0)
    sw $v0, region_vulnerability($t1)

    # Get Distance
    print_str(prompt_dist)
    read_int($v0)
    sw $v0, region_distance($t1)

    # Increment counter and repeat
    addi $t0, $t0, 1
    j region_loop

input_done:
    pop($ra)                
    jr $ra                  
