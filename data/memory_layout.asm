.data
.align 2 

region_ids:         .word 0:MAX_REGIONS  
region_populations: .word 0:MAX_REGIONS  
region_severity:    .word 0:MAX_REGIONS  
region_vulnerability:.word 0:MAX_REGIONS
region_distance:    .word 0:MAX_REGIONS  
region_priority:    .word 0:MAX_REGIONS 

food_allocated:     .word 0:MAX_REGIONS  
meds_allocated:     .word 0:MAX_REGIONS
unmet_demand:       .word 0:MAX_REGIONS

current_region_count: .word 0             
total_food_available: .word 0             
total_meds_available: .word 0             

total_distributed:    .word 0
efficiency_rating:    .word 0
