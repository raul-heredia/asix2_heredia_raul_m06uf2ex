#!/bin/bash

clear

if [[ $EUID -ne 0 ]]; then
   echo "Aquest script ha de ser executat com a root" 
   exit 1
fi

echo -n "Introdueix el nom d'usuari: "
read USUARI

id -u ${USUARI} 2>/dev/null

if [[ $? -ne 0 ]]; then
    echo "[ERROR] L'usuari ${USUARI} no existeix al sistema"
    exit 1
fi
exit 0