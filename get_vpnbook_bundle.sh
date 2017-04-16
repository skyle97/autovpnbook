#! /bin/bash
#
# Written by Rupe
# Get vpnbook OpenVpn Certificate Bundle
# from vpnbook.com  v.1.1
#

cleanup() {
  rm VPN*.zip && rm $0 && clear; echo -e "\n"; banner; echo -e \
  "\033[1;32m$(date)  You have $(ls *.ovpn|wc -l) \
OpenVPNBook Servers available.\033[0m\n"
  ls --color
}

trap cleanup Exit

banner() {
  echo   " / _\ / )( \(_  _)/  \ / )( \(  _ \(  ( \(  _ \ /  \  /  \(  / )"
  echo   "/    \) \/ (  )( (  O )\ \/ / ) __//    / ) _ ((  O )(  O ))  ("
  echo   "\_/\_/\____/ (__) \__/  \__/ (__)  \_)__)(____/ \__/  \__/(__\_)"
}

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