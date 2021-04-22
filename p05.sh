#!/bin/bash



if [[ $EUID -ne 0 ]]; then
   echo "Aquest script ha de ser executat com a root" 
   exit 1
fi

REPETEIX=1

while [[ $REPETEIX -eq 1 ]]; do
clear
echo -n "Quin paquet vols instal·lar?: "
read PAQUET

apt update > /dev/null 2>&1

apt install $PAQUET -y > /dev/null 2>&1

if [[ $? -eq 0 ]]; then
    echo "El paquet $PAQUET s'ha instal·lat correctament"
else
    echo "Comprova la connectivitat i/o el nom del paquet."
fi

echo -n "Vols continuar? Prem '1' per continuar: "
read REPETEIX
done
exit 20