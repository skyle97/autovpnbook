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
  echo -e " 		$R A$W""utoVPNBook 1.1$G By$Y R$W""uped$Y""24$GR &$Y K$W""0RT3X-$Y""R$W""00T "
  sleep 5

  setting

}

############ SPINNER FIN #############################################################


########### SET LANGUAGE ############################################################

function setting {

  conditional_clear

  if [[ "$AVPNB_AUTO" =  "1" ]]
  then
    english; setinterface
  else

    while true
    do
      #conditional_clear
      top

      echo -e "" $R"["$Y"i"$R"]"$W" Select your language"
      echo "                                       "
      echo -e "
        $G 1)$W English
        $G 2)$W French
        $G 3)$W Spanish "


      echo
      read -p" Choice: " choice
      echo ""
      case $choice in
        1 ) english; main; break ;;
        2 ) french; main; break;;
        3 ) spanish; main; break;;
        * ) echo -e "$W [$R ERROR $W]" && sleep 3 ;setting;;
      esac
    done
  fi

}

function english {

  START="S T A R T I N G  S E R V E R"
  OFF=" Thank you for using AutoVPNBook"
  CLOSE="$W C L O S I N G..."
  error=" ERROR"
  Fmissing="\nautovpnbook.py file is missing!"
  SRVconnect="\nEnter vpnbook-srv-proto.ovpn file to connect"
  Infoserv=" You have"
  Infoserv2="OpenVPNBook Servers available."
  Server=" Server"
  Choice=" Choice"
  ENTER="ENTER"
  Exit="Exit "
  Inst="Install"
  Dep="Install dependencies, please wait"
  Rvpn="Run AutoVPN"
  INFOMSG=" Automatic connection (servers OpenVPN)"
  Return="Return"

}

function french {

  START="D E M A R R A G E  D U  S E R V E R"
  OFF="Merci d'avoir utilisé AutoVPNBook"
  CLOSE="$W F E R M E T U R E..."
  error="ERREUR"
  Fmissing="\nautovpnbook.py est absent!"
  SRVconnect="\nEntrez un vpnbook-srv-proto.ovpn pour vous connecter"
  Infoserv=" Vous avez"
  Infoserv2="Serveurs OpenVPNBook disponibles."
  Server="Serveur"
  Choice=" Choix"
  ENTER="ENTREE"
  Exit="Fermer "
  Inst="Installation"
  Dep="Installation des dependences, merci de patienter"
  Rvpn="Lancez AutoVPN"
  INFOMSG=" Connexion automatique (servers OpenVPN)"
  Return="Retour"

}

function spanish {

  START="I J E C U T A R  E L  S E R V I D O R"
  OFF="Gracias por usar AutoVPNBook"
  CLOSE="$W C I E R R E..."
  error="ERROR"
  Fmissing="\nautovpnbook.py es absent!"
  SRVconnect="\nInstroducir una vpnbook-srv-proto.ovpn para conectar"
  Infoserv=" Usted tiene"
  Infoserv2="Servidors OpenVPNBook disponible."
  Server="Servidor"
  Choice=" Seleccion"
  ENTER="ENTRAR"
  Exit="Cerrar "
  Inst="Instalar"
  Dep="Instalacion de dependencias, gracias por su paciencia"
  Rvpn="Lanzamiento AutoVPN"
  INFOMSG=" Automatic connection (servers OpenVPN)"
  Return="Volver"

}

########### SET LANGUAGE END #######################################################


######## MENU 1 MENU ################################################################

function main {

  clear

  echo

  top

  echo
  echo
  echo -e "  $W$nar "
  echo -e "
    $G 1)$W Info
    $G 2)$W Menu
    $R 0)$W $Exit "
  echo
  read -p " $Choice: " choice
  case $choice in
    1) information;;
    2) MENU;;
    0) EXITMENU;;
    *) echo -e "$W [$R $error$W ]" && sleep 2
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
  echo -e "$G   Name:$W......AutoVPNBook"
  sleep 0.2
  echo -e "$G   Version:$W...1.1"
  sleep 0.2
  echo -e "$G   Language:$W..[ENG, FR, SPANISH]"
  sleep 0.2
  echo -e "$G   Date:$W......$(date +"%m-%d-%y")"
  sleep 0.2
  echo -e "$G   Author:$W....Ruped24 & K0RT3X-R00T"
  sleep 0.2
  echo -e "$G   Type:$W......VPN"
  sleep 0.2
  echo -e "$G   Dev:$W.......Shell, Python "
  echo
  echo
  echo -e " $INFOMSG"
  echo
  sleep 0.5
  echo -e " $Return$R [$ENTER]$W"
  read pause
  main

}

###### INFO FIN ####################################################################


######### MENU 2 ###########################################################

function MENU {

  clear

  echo

  top

  echo -e "   $W$nar"
  sleep 0.2
  echo -e "
    $G 1)$W $Inst
    $G 2)$W $Rvpn
    $R 0)$W $Exit "
  echo
  read -p " $Choice: " choice
  case $choice in
    1) installation;;
    2) RUNVPN;;
    3) main;;
    0) EXITMENU;;
    *) echo -e "$W [$R $error$W ]" && sleep 2
  esac

  MENU

}

######## MENU 2 END ######################################################


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
    echo -e "$Dep...\n"
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

  SERVERLIST=$(ls *.ovpn 2> /dev/null |wc -l)

  echo -e " Servers list"
  echo
  echo -e "$G $Infoserv$W $SERVERLIST$G $Infoserv2$W"
  echo
  ls -x *.ovpn 2> /dev/null
  echo
  read -p "$Server: " SERV
  clear
  top
  echo
  echo -e "$START"
  echo
  sleep 0.5
  echo -e "$W [$Y?$W] Ctrl+c stop VPN"

  sleep 2

  if [[ ! -f "autovpnbook.py" ]]
  then
    echo -e "$Fmissing"
    sleep 5
  fi

  if [[ ! $SERV ]]
  then
    echo -e "$SRVincorSRVincor"
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
  echo -e " $W~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  echo -e " $R     A$W""utoVPNBook $GR v$G 1.1 "
  echo -e " $W~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  sleep 0.5
  echo

}

#### FONTION TOP END ################################################################


##### FERMETURE DU PROGRAMME ######################################################

function EXITMENU {

  clear
  echo
  top
  echo -e "$CLOSE"
  sleep 2
  echo
  sleep 0.5
  echo
  echo -e " [$R*$W] $G $OFF""$W   [$R*$W]"
  sleep 3
  clear
  exit

}

###### FIN (END) #################################################################

spinner