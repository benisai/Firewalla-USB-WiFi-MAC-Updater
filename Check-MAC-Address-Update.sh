#!/bin/bash

# Function to change MAC address for a given interface
change_mac_address() {
    interface="$1"
    mac_prefix="$2"

    # Get the physical MAC address of the USB Wi-Fi device
    physical_mac=$(ip link show $interface | awk '/ether/ {print $2}')

    echo "Interface: $interface"
    echo "Physical MAC address: $physical_mac"

    # Replace the first three octets of the physical MAC address
    new_mac="$mac_prefix:${physical_mac:9}"

    echo "New MAC address: $new_mac"

    # Change the MAC address of the interface
    echo "Changing MAC address for $interface..."
    sudo ifconfig $interface down
    sudo ifconfig $interface hw ether $new_mac
    sudo ifconfig $interface up

    echo "MAC address changed successfully for $interface!"
}

# Function to check MAC address and correct it if it does not match the expected prefixes
check_and_correct_mac_address() {
    interface="$1"
    expected_prefix="$2"

    # Get the current MAC address of the interface
    current_mac=$(ip link show $interface | awk '/ether/ {print $2}')
    current_prefix="${current_mac:0:8}"

    echo "Checking interface: $interface"
    echo "Current MAC address: $current_mac"

    # If the current prefix does not match the expected one, update the MAC address
    if [[ "$current_prefix" != "$expected_prefix" ]]; then
        echo "WARNING: MAC address of $interface does not match the expected prefix. Correcting..."
        change_mac_address "$interface" "$expected_prefix"
    else
        echo "MAC address of $interface is as expected."
    fi
}

# Main loop to continuously monitor and correct MAC addresses
while true; do
    # Check and correct MAC address for wlan0
    check_and_correct_mac_address "wlan0" "20:6d:31"

    # Check and correct MAC address for wlan1
    check_and_correct_mac_address "wlan1" "22:6d:31"

    # Wait for a specified time interval before checking again
    sleep 60 # Waits for 60 seconds
done
