# MAC Updater Script
This script will change the MAC address of your usb wifi RTL8811CU to 20:6d:31/22:6d:31 MAC Address so the phone APP recongizes the USB WIFI. 
It will only update the first three octets of the MAC Address and keep the remaining. 
It must have the chipset RTL8811CU. 
I purchased this one from Amazon for $13 bucks: https://a.co/d/gGwqthB


```
pi@Firewalla:~ (FWPSE) $ sudo ./USB-WiFi-MAC-Updater.sh
Interface: wlan0
Physical MAC address: 90:de:80:3b:f6:bb
New MAC address: 20:6d:31:3b:f6:bb
Changing MAC address for wlan0...
MAC address changed successfully for wlan0!
Interface: wlan1
Physical MAC address: 92:de:80:3b:f6:bb
New MAC address: 22:6d:31:3b:f6:bb
Changing MAC address for wlan1...
MAC address changed successfully for wlan1!
```
