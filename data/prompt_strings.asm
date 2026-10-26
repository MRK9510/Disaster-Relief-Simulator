.data

msg_welcome:    .asciiz "\n------------------------------------------------\n"
msg_title:      .asciiz "   DISASTER RELIEF SUPPLY ALLOCATION SIMULATOR   \n"
msg_line:       .asciiz "------------------------------------------------\n"

#Scenario Prompts 
prompt_disaster: .asciiz "\nSelect Disaster Type(enter number) \n1:Earthquake, 2:Flood, 3:Epidemic: "
prompt_regions:  .asciiz "Enter number of affected regions (Max 10): "
prompt_food:     .asciiz "Enter total Food Units available: "
prompt_meds:     .asciiz "Enter total Medical Kits available: "

#Region Data Prompts 
prompt_reg_header: .asciiz "\n--- Data Entry for Region #"
prompt_pop:        .asciiz "  Enter Population: "
prompt_sev:        .asciiz "  Enter Severity Level (1-10): "
prompt_vuln:       .asciiz "  Enter Vulnerability (1-10): "
prompt_dist:       .asciiz "  Enter Distance from Depot (in km): "

#Processing
msg_calc:       .asciiz "\n Calculating Priority...\n"
msg_sort:       .asciiz "Sorting Regions by Urgency...\n"
msg_alloc:      .asciiz "Executing Allocation logic...\n"

#Report Table Header
msg_report_title: .asciiz "\n================ ALLOCATION REPORT ================\n"
msg_table_head:   .asciiz "ID\tScore\tPopu\tFood\tMeds\tStatus\n"
msg_table_line:   .asciiz "---------------------------------------------------\n"

#Status
status_full:     .asciiz "FULL"
status_partial:  .asciiz "PARTIAL"
status_none:     .asciiz "NONE"

#Results 
msg_total_dist:  .asciiz "\nTotal Supplies Distributed: "
msg_unmet:       .asciiz "\nUnmet Demand Count: "
msg_efficiency:  .asciiz "\nSystem Efficiency Score: "
msg_percent:     .asciiz "%"

#Error Messages -
err_invalid:     .asciiz "[ERROR] Invalid input. Please try again.\n"
err_overflow:    .asciiz "[ERROR] Supply capacity exceeded.\n"
