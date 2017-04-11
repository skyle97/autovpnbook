#! /bin/bash
#
# Get vpnbook OpenVpn Certificate Bundle
#

cleanup() {
  rm VPN*.zip && rm $0
}

trap cleanup Exit

wget -r -l1 -H -t1 -nd -N -np -A.zip -erobots=off \
http://www.vpnbook.com/#openvpn && \

for bundle in $(ls VPN*.zip)
do
  unzip $bundle
done

exit $?
