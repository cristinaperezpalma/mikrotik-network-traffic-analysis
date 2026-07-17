#!/bin/bash

# Preguntar en qué isla y en qué PC te encuentras y guardar los valores.
read -p "En qué isla te encuentras: " Isla
read -p "En qué PC te encuentras: " pc

# Definir las variables de IP.
ip1="33.$Isla.1.1"
ip2="33.$Isla.1.2"
ip3="33.$Isla.2.3"
ip4="33.$Isla.2.4"
ip5="33.$Isla.3.5"
ip6="33.$Isla.3.6"
ip7="33.$Isla.3.7"

# Iniciar los servidores iperf en los puertos 5001 a 5007.
if [ $pc -ne 1 ]; then
  iperf -s -D -p 5001
fi

if [ $pc -ne 2 ]; then
  iperf -s -D -p 5002
fi

if [ $pc -ne 3 ]; then
  iperf -s -D -p 5003
fi

if [ $pc -ne 4 ]; then
  iperf -s -D -p 5004
fi

if [ $pc -ne 5 ]; then
  iperf -s -D -p 5005
fi

if [ $pc -ne 6 ]; then
  iperf -s -D -p 5006
fi

if [ $pc -ne 7 ]; then
  iperf -s -D -p 5007
fi


echo "Programa finalizado."
