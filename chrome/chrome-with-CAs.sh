#!/bin/bash

###
### Requirement: apt install libnss3-tools
###

###
### Create cert DB and import CA
###

mkdir -p ~/.pki/nssdb
certutil -d sql:$HOME/.pki/nssdb -N --empty-password
certutil -d sql:$HOME/.pki/nssdb -A -t TC -n "${CA_NAME}" -i ${CA_FILE}

###
### Launch chrome
###
google-chrome $@