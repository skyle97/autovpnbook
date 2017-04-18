#! /bin/bash
#
# AutoVPNBook Menu Written by Ruped24 & K0RT3X-R00T
# Get vpnbook OpenVpn Certificate Bundle from vpnbook.com  v.1.1
#

#### Configuration ################################################################

## USERNAME in username.txt
## PASSWORD in password.txt

#### Colors #######################################################################

W="\033[1;37m"
GR="\033[0;37m"
R="\033[1;31m"
G="\033[1;32m"
Y="\033[1;33m"
EC="\033[0m"

nar="   M E N U "
Titre=" AutoVPNBook v1.0 "

###### CONFIG FIN #################################################################


#### SPINNER ########################################################################

function spinner {

  clear
  echo
  sleep 0.5
  echo -e  "$G
      __   _  _  ____  __   _  _  ____  __ _  ____   __    __  __ _
     / _\ / )( \(_  _)/  \ / )( \(  _ \(  ( \(  _ \ /  \  /  \(  / )
    /    \) \/ (  )( (  O )\ \/ / ) __//    / ) _ ((  O )(  O ))  (
    \_/\_/\____/ (__) \__/  \__/ (__)  \_)__)(____/ \__/  \__/(__\_)

  "
  sleep 0.5
  echo -e " $R A$W""utoVPNBook 1.1$G By$Y Ruped24 & K0RT3X-R00T $W"
  sleep 5
  main

}

############ SPINNER FIN #############################################################


######## MAIN MENU ################################################################

function main {

  clear

  echo

  top

  echo
  echo
  echo -e "  $W$nar"
  echo -e "
    $G 1)$W Info
    $G 2)$W Menu
    $R 0)$W Exit "
  echo
  read -p " Choice: " choice
  case $choice in
    1) information;;
    2) MENU;;
    0) EXITMENU;;
    *) echo -e "$W [$R ERROR$W ]" && sleep 2
  esac

  main

}

####### MENU 1 FIN ##################################################################


### INFO ############################################################################

function information {

  clear

  echo

  top

  echo
  echo -e "$G   Name:$W.......AutoVPNBook"
  sleep 0.2
  echo -e "$G   Version:$W...1.1"
  sleep 0.2
  echo -e "$G   Language:$W....[ENG]"
  sleep 0.2
  echo -e "$G   Date:$W....$(date +"%m-%d-%y")"
  sleep 0.2
  echo -e "$G   Author:$W...Ruped24 & K0RT3X-R00T"
  sleep 0.2
  echo -e "$G   Type:$W......VPN"
  sleep 0.2
  echo -e "$G   Dev:$W.......Shell, Python "
  echo
  echo
  echo -e " Automatic connection (servers OpenVPN)"
  echo
  sleep 0.5
  echo -e " Return$R [ENTER]$W"
  read pause
  main

}

###### INFO FIN ####################################################################


######### GVPN ###########################################################

function MENU {

  clear

  echo

  top

  echo -e " $W$nar"
  sleep 0.2
  echo -e "
    $G 1)$W Installation
    $G 2)$W Run AutoVPN
    $R 0)$W Exit "
  echo
  read -p " Choice: " choice
  case $choice in
    1) installation;;
    2) RUNVPN;;
    3) main;;
    0) EXITMENU;;
    *) echo -e "$W [$R ERROR$W ]" && sleep 2
  esac

  MENU

}

######## GVPN END ######################################################


######## INSTALL ######################################################

function installation {

  clear

  echo

  top

  echo
  echo -e "I N S T A L L A T I O N"
  echo
  sleep 1

  INSTALLED=$(ls *.ovpn 2> /dev/null |wc -l)

  [[ $(which openvpn) ]] && \
  [[ $(dpkg --list | grep pexpect) ]]
  if [[ $? -ne '0' ]]
  then
    echo -e "Installing dependencies, please wait...\n"
    sudo apt-get -yq=2 install openvpn python-pexpect &> /dev/null
  fi

  if [[ $INSTALLED -eq '0' ]]
  then
    wget -r -l1 -H -t1 -nd -N -np -A.zip -erobots=off \
    http://www.vpnbook.com/#openvpn

    for bundle in $(ls VPN*.zip)
    do
      unzip $bundle
    done

    sleep 0.5

    for VPNzip in $(ls VPN*.zip)
    do
      rm $VPNzip
    done

    sleep 0.5

    for ovpn in $(ls *.ovpn)
    do
      sed -i '11i auth-nocache' $ovpn
    done

    sleep 0.5

    curl -s "http://www.vpnbook.com/#openvpn" \
    | grep -A 1 "Username: vpnbook" | tail -n 2 \
    | cut -f2 -d " " | cut -f1 -d '<' > username.txt

    sleep 0.5

    curl -s "http://www.vpnbook.com/#openvpn" \
    | grep -A 1 "Password:" | tail -n 2 | cut -d ':' -f2 \
    | cut -d '<' -f1 | tr -d ' ' > password.txt
    sleep 0.5
  fi

  clear

  RUNVPN

}

##### INSTALL END ###############################################################


######## RUN VPN ######################################################

function RUNVPN {

  clear

  echo

  top

  SERVERSLIST=$(ls *.ovpn 2> /dev/null |wc -l)

  echo -e " Servers list"
  echo
  echo -e "$G You have $SERVERSLIST OpenVPNBook Servers available.$EC\n"
  echo
  ls -x *.ovpn 2> /dev/null
  echo
  read -p "Server: " SERV
  clear
  top
  echo
  echo -e "S T A R T I N G  S E R V E R"
  echo
  sleep 0.5
  echo -e "$W [$Y?$W] Ctrl+c stop VPN"

  sleep 2

  if [[ ! -f "autovpnbook.py" ]]
  then
    echo -e "\nautovpnbook.py file is missing!"
    sleep 5
  fi

  if [[ ! $SERV ]]
  then
    echo -e "\nEnter vpnbook-srv-proto.ovpn file to connect"
    sleep 2
  fi

  sudo ./autovpnbook.py $SERV

}

##### RUN VPN END ###############################################################


##### Fonction Top ###############################################################

function top {

  clear
  echo
  sleep 0.1
  echo -e " $W~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  echo -e " $R A$W""utoVPNBook $GR v$G 1.1 "
  echo -e " $W~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  sleep 0.5
  echo

}

#### FONTION TOP END ################################################################


##### FERMETURE DU PROGRAMME ######################################################

function EXITMENU {

  clear
  echo
  top
  echo -e "$W C L O S I N G..."
  sleep 2
  echo
  sleep 0.5
  echo
  echo -e " [$R*$W] $G Thank you for using AutoVPNBook$W  [$R*$W]"
  sleep 3
  clear
  exit

}

###### FIN (END) #################################################################

spinner