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
* Download [autovpnbook repository](https://bitbucket.org/ruped24/autovpnbook/get/884471648bee.zip) and unzip.

* Download All [VPNBOOK](https://www.vpnbook.com/freevpn)'s Server OpenVPN Certificate Bundles.
 
* Run get_vpnbook_bundle.sh.
 


Usage: 
```
#!bash

./get_vpnbook_bundle.sh
```


## Step 2: ##
* Automatic login to vpnbook. No username or password required.



Usage: 
```
#!python

sudo ./autovpnbook.py <vpnbook-file-proto.ovpn>
```

##### Disclaimer: ######

###### These scripts is written for educational purposes only!

** [Screenshot](https://drive.google.com/open?id=0B79r4wTVj-CZMlBhTnRwTUxUdDA) ** :wink: