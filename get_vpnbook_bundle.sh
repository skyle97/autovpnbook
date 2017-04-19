#! /bin/bash
#
# Written by Rupe
# Download and setup vpnbook OpenVpn Certificate Bundle v.1.1
#

# Check for dependencies and install if missing
[[ $(which openvpn) ]] && \
[[ $(dpkg --list | grep pexpect) ]]
[[ $? -ne '0' ]] && echo -e "\nInstalling Dependencies, please wait...\n" && \
sudo apt-get update -q=2 &> /dev/null && \
sudo apt-get -yq=2 install openvpn python-pexpect &> /dev/null

cleanup() {
  rm VPN*.zip && rm $0 && \
  sudo ./avpnb.sh
}

trap cleanup Exit

dwnld_cert_bundle() {
  wget -r -l1 -H -t1 -nd -N -np -A.zip -erobots=off \
  http://www.vpnbook.com/#openvpn
  return $?
}

unpack_bundle() {
  for bundle in $(ls VPN*.zip)
  do
    unzip $bundle
  done
  return $?
}

auth_nocache() {
  for ovpn in $(ls *.ovpn)
  do
    sed -i '11i auth-nocache' $ovpn
  done
  return $?
}

get_username() {
  curl -s "http://www.vpnbook.com/#openvpn" \
  | grep -A 1 "Username: vpnbook" | tail -n 2 \
  | cut -f2 -d " " | cut -f1 -d '<' > username.txt
  return $?
}

get_password() {
  curl -s "http://www.vpnbook.com/#openvpn" \
  | grep -A 1 "Password:" | tail -n 2 | cut -d ':' -f2 \
  | cut -d '<' -f1 | tr -d ' ' > password.txt
  return $?
}

dwnld_cert_bundle && \
unpack_bundle && \
auth_nocache && \
get_username && \
get_password

exit $?