#! /usr/bin/env python
#
# Autovpnbook Written by Rupe 4-10-17
#

import contextlib
from os import geteuid
from os.path import basename
from sys import argv
from urllib2 import urlopen

import pexpect


def get_password():
  with contextlib.closing(urlopen(
      'http://www.vpnbook.com/#openvpn')) as request:
    html = request.read().split()
    passwd = html.index('<li><strong>Password:') + 1
    Password = html[passwd].split('<')[0]
  return Password


def auto_login(ovpn):
  openvpnbook = pexpect.spawn('openvpn --config %s' % ''.join(ovpn))
  openvpnbook.expect('Enter Auth Username:')
  openvpnbook.sendline('vpnbook')
  openvpnbook.expect('Enter Auth Password:')
  openvpnbook.sendline(get_password())
  openvpnbook.interact()


if __name__ == '__main__':
  if geteuid() is not 0:
    exit("\033[91m[!]\033[0m Run as super user!")
  try:
    auto_login(argv[1:])
  except:
    exit("\nUsage: %s <vpnbook-file-proto.ovpn> \n" % basename(__file__))