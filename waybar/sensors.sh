#!/bin/bash

# Function to safely get sensor value or return N/A
get_sensor_value() {
    local value=$(sensors "$1" 2>/dev/null | grep "$2" | awk '{print $2}')
    echo "${value:=N/A}"
}

# CPU Information
cpu_temp=$(get_sensor_value "k10temp-pci-00c3" "Tctl:")
cpu_fan=$(get_sensor_value "asus-isa-0000" "cpu_fan:")

# GPU Information
gpu_temp=$(get_sensor_value "amdgpu-pci-0600" "edge:")
gpu_fan=$(get_sensor_value "asus-isa-0000" "gpu_fan:")
gpu_power=$(get_sensor_value "amdgpu-pci-0600" "PPT:")

# NVMe Temperatures
nvme1_temp=$(get_sensor_value "nvme-pci-0400" "Composite:")
nvme2_temp=$(get_sensor_value "nvme-pci-0500" "Composite:")

# Battery Information
battery_voltage=$(get_sensor_value "BAT1-acpi-0" "in0:")
battery_current=$(get_sensor_value "BAT1-acpi-0" "curr1:")

# Voltage Information
gpu_vddgfx=$(get_sensor_value "amdgpu-pci-0600" "vddgfx:")
gpu_vddnb=$(get_sensor_value "amdgpu-pci-0600" "vddnb:")

# Prepare tooltip output
tooltip_output=$(cat <<EOF
🌡️ Temperatures:
  CPU: $cpu_temp
  GPU: $gpu_temp
  NVMe 1: $nvme1_temp
  NVMe 2: $nvme2_temp

💨 Fan Speeds:
  CPU Fan: $cpu_fan RPM
  GPU Fan: $gpu_fan RPM

⚡ Power & Voltage:
  GPU Power: $gpu_power V
  GPU VddGFX: $gpu_vddgfx V
  GPU VddNB: $gpu_vddnb V

🔋 Battery:
  Voltage: $battery_voltage V
  Current: $battery_current A
EOF
)

# Output for main bar (CPU usage percentage)
top_output=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Output for Waybar
echo "$top_output"

# Print tooltip output to a file for Waybar to read
echo "$tooltip_output" > /tmp/waybar_sensors_tooltip
