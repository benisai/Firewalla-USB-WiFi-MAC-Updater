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

# Check if any Wi-Fi interfaces are connected
interfaces=$(ip link | awk -F: '$0 !~ "lo|vir|^[^0-9]"{print $2;getline}')
if [ ! -z "$interfaces" ]; then
    for interface in $interfaces; do
        if [[ $interface == wlan0 ]]; then
            change_mac_address "$interface" "20:6d:31"
        elif [[ $interface == wlan1 ]]; then
            change_mac_address "$interface" "22:6d:31"
        fi
    done
else
    echo "No USB Wi-Fi devices found."
fi
