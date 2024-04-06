# Firewalla MAC Updater Script for Generic RTL8811CU
This script will change the MAC address of your generic usb wifi RTL8811CU to 20:6d:31:xx:xx:xx (2.4ghz) / 22:6d:31:xx:xx:xx (5ghz) so the phone APP recongizes the USB WIFI.  
It will only update the first three octets of the MAC Address and keep the remaining. 
It must have the chipset RTL8811CU. 
I purchased this one from Amazon for $13 bucks: https://a.co/d/gGwqthB

> Note: I  have a real USB Wifi from Firewalla, so my Wifi was already configured. After I updated the MAC address, the generic USB RTL8811CU was recongized in the app. Please let me know if this script works for you on a fresh device with no Wifi. 👍

![image](https://github.com/benisai/Firewalla-USB-WiFi-MAC-Updater/assets/59147467/1f88f747-0887-4566-bb2f-d2ff20f4d7ff)



# How to Use 
Customized Scripts
You can add some scripts to Gold/Purple so that it can be automatically executed when Firewalla service restarts (for example, when Gold/Purple reboots or software updates).

These scripts can be placed under this folder /home/pi/.firewalla/config/post_main.d/ (create this folder if it does not exist)

$ sudo mkdir /home/pi/.firewalla/config/post_main.d/
$ cd /home/pi/.firewalla/config/post_main.d/
$ sudo chmod +wr .
 

Create a file with any name ending in with ".sh" and make it executable. For example:

$ sudo nano /home/pi/.firewalla/config/post_main.d/update-usb-wifi-mac.sh
$ sudo chmod +x /home/pi/.firewalla/config/post_main.d/update-usb-wifi-mac.sh
Any files ending with ".sh" will be executed at boot time.


Below is the output from shell:
```
pi@Firewalla:~ (FWPSE) $ sudo chmod +x ./USB-WiFi-MAC-Updater.sh
pi@Firewalla:~ (FWPSE) $ sudo ./USB-WiFi-MAC-Updater.sh

Output:

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
