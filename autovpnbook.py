#! /usr/bin/env python
#
# Autovpnbook Written by Rupe 4-10-17 V.1.0
#

from contextlib import closing
from os import geteuid
from os.path import basename
from sys import argv
from urllib2 import urlopen

import pexpect


class AutoVpnBook(object):

  def __init__(self):
    self.Password = self.get_password()
    self.passwd_file()

  def passwd_file(self):
    with open('password.txt', 'w') as passwd:
      passwd.write(self.Password + '\n')

  def get_password(self):
    with closing(urlopen('http://www.vpnbook.com/#openvpn')) as request:
      html = request.read().split()
      passwd = html.index('<li><strong>Password:') + 1
      Password = html[passwd].split('<')[0]
    return Password

  def auto_login(self, ovpn):
    openvpnbook = pexpect.spawn('openvpn --config %s' % ''.join(ovpn))
    openvpnbook.expect('Enter Auth Username:')
    openvpnbook.sendline('vpnbook')
    openvpnbook.expect('Enter Auth Password:')
    openvpnbook.sendline(self.Password)
    openvpnbook.interact()


if __name__ == '__main__':
  if geteuid() is not 0:
    exit("\033[91m[!]\033[0m Run as super user!")
  try:
    AutoVpnBook().auto_login(argv[1:])
  except:
    exit("\nUsage: %s <vpnbook-file-proto.ovpn> \n" % basename(__file__))