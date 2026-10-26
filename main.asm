.include "utills\macros.asm"
.include "data\global_constants.asm"
.include "data\prompt_strings.asm"
.include "data\memory_layout.asm"

.text
.globl main

main:
    jal get_user_input
    
    jal calculate_priorities

    jal sort_regions

    jal allocate_supplies

    jal generate_report

    exit_program

.include "logic\input_handler.asm"
.include "logic\calculations.asm"
.include "logic\sorter.asm"
.include "logic\allocator.asm"
.include "logic\report_generator.asm"
