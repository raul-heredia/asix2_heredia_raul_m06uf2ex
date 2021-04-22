#!/bin/bash

REGEX='\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.|$)){4}\b'


if [[ $EUID -ne 0 ]]; then
   echo "Aquest script ha de ser executat com a root" 
   exit 1
fi

echo -n "Indica una adreça IP: "
read ADDRESS

if [[ $ADDRESS =~ $REGEX ]]
then    
	nmap -sS $ADDRESS
else
    echo "Adreça incorrecta"
	exit 10
fi
exit 0