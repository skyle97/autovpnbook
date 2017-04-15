Dependencies:
openvpn pexpect
```
#!bash

sudo apt-get -y install openvpn python-pexpect
```


## Step 1: ##
1. Download [autovpnbook repository](https://bitbucket.org/ruped24/autovpnbook/get/dde5323135e5.zip) and unzip.

2. Download All [VPNBOOK](https://www.vpnbook.com/freevpn)'s Server OpenVPN Certificate Bundles 

3. Run get_vpnbook_bundle.sh.



Usage: 
```
#!bash

./get_vpnbook_bundle.sh
```


## Step 2: ##
Usage: 
```
#!python

sudo ./autovpnbook.py <vpnbook-file-proto.ovpn>
```

##### Disclaimer: ######

###### These scripts is written for educational purposes only!  I assume no responsibility by the use or intended use of these scripts. ######

** [Screenshot](https://drive.google.com/open?id=0B79r4wTVj-CZMlBhTnRwTUxUdDA) ** :wink: