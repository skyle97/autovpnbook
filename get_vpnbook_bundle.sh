#! /bin/bash
# 
# Written by Rupe
# Get vpnbook OpenVpn Certificate Bundle
#

cleanup() {
  rm VPN*.zip && rm $0
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

dwnld_cert_bundle && \
unpack_bundle && \
auth_nocache

exit $?
