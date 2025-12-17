# ping-and-toggle-smart-outlet
The .ps1 file included is the script for pinging an IP and sending a reset signal to a Kasa Smart Plug if the ping is not successful.
This is useful for remotely power cycling network-accessible hardware.

You also need to set the target device's UEFI/BIOS to be "Turn On After AC Power Loss" so the machine boots once the smart plug toggles back on.

For best results, combine this with a USB Watchdog device which can perform a power-on or restart based on a cron job on the hardware.

## Install:
- Python for Windows
- Python-kasa from https://github.com/python-kasa/python-kasa

## This code includes minimal error handling and assumes:
- the network device you want to ping and power cycle if it's not responsive has a local IP of: **192.168.1.10**
- your Kasa Smart Plug has a local IP of: **192.168.1.11**
- a **15-second** delay is sufficient for your hardware's power cycle timing

This was tested and worked using the Kasa Smart Wi-Fi Plug Mini model HS103.
