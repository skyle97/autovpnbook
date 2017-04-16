# AUTOVPNBOOK #
## Automatically Login And Connect To VPNBook ##
***



Dependencies:
openvpn pexpect
```
#!bash

sudo apt-get -y install openvpn python-pexpect
```


## Step 1: ##
* Download [autovpnbook repository](https://bitbucket.org/ruped24/autovpnbook/get/46b759055406.zip) and unzip.

* Run **get_vpnbook_bundle.sh** to Download All [VPNBOOK](https://www.vpnbook.com/freevpn)'s Server OpenVPN Certificate Bundles.
 
 

Usage: 
```
#!bash

./get_vpnbook_bundle.sh
```


## Step 2: ##
* Automatic login to vpnbook. No username or password required.
* To properly terminate a session, press Crtl+C.


Usage: 
```
#!python

sudo ./autovpnbook.py <vpnbook-file-proto.ovpn>
```

##### Disclaimer: ######

###### These scripts is written for educational purposes only!

** [Screenshot](https://drive.google.com/open?id=0B79r4wTVj-CZMlBhTnRwTUxUdDA) ** :wink: