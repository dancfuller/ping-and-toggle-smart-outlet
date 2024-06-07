# ping-and-toggle-smart-outlet
The .ps1 file included is the script for pinging an IP and sending a reset signal to a Kasa Smart Plug if the ping is not successful.
This is useful for remotely power cycling network-accessible hardware.

Install:
Python for Windows
Python-kasa from https://github.com/python-kasa/python-kasa

This code includes no error handling and assumes:
the network device you want to power cycle has a local IP of: 192.168.1.10
your Kasa Smart Plug has a local IP of: 192.168.1.11
a 5-second delay is sufficient for your hardware's power cycle timing

This was tested and working using specifically the Kasa Smart Wi-Fi Plug Mini model HS103.
