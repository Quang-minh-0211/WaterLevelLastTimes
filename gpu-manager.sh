#!/bin/bash

# Script to monitor NVIDIA GPU usage, VRAM consumption, and VRAM left

# Interval between updates in seconds
INTERVAL=1

# Function to display GPU info
function display_gpu_info {
    clear
    echo "----------------------------"
    echo "NVIDIA GPU Usage Monitor"
    echo "----------------------------"
    echo "Date: $(date)"
    echo "----------------------------"
    
    # Querying the GPU usage, memory used, total memory, and available memory
    nvidia-smi --query-gpu=utilization.gpu,memory.used,memory.total,memory.free,temperature.gpu --format=csv,noheader,nounits | while IFS=, read -r gpu_util mem_used mem_total mem_free gpu_temp; do
        # Print GPU details for each GPU
        echo "GPU Utilization: ${gpu_util}%"
        echo "VRAM Used: ${mem_used} MiB"
        echo "Total VRAM: ${mem_total} MiB"
        echo "VRAM Free: ${mem_free} MiB"
        echo "GPU Temperature: ${gpu_temp} C"
        echo "----------------------------"
    done
}

# Loop to display GPU info at regular intervals
while true; do
    display_gpu_info
    sleep $INTERVAL
done
