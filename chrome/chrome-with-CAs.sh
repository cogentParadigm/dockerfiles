#!/bin/bash

###
### Requirement: apt install libnss3-tools
###

###
### Create cert DB and import CA
###

if [ ! -d $HOME/.pki/nssdb ]; then
  mkdir -p $HOME/.pki/nssdb
  certutil -d sql:$HOME/.pki/nssdb -N --empty-password
fi
certutil -d sql:$HOME/.pki/nssdb -A -t TC -n "${CA_NAME}" -i ${CA_FILE}

###
### Launch chrome
###
google-chrome $@