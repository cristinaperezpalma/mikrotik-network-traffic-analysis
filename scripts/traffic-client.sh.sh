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


# Configurar el cliente iperf en el PC actual.

#if [ $pc -ne 1 ]; then
#  iperf -c $ip1 -p 500$pc -t 3600 &
#fi

#if [ $pc -ne 2 ]; then
#  iperf -c $ip2 -p 500$pc -t 3600 &
#fi

if [ $pc -ne 3 ]; then
  iperf -c $ip3 -p 500$pc -t 3600 &
fi

if [ $pc -ne 4 ]; then
  iperf -c $ip4 -p 500$pc -t 3600 &
fi

if [ $pc -ne 5 ]; then
  iperf -c $ip5 -p 500$pc -t 3600 &
fi

if [ $pc -ne 6 ]; then
  iperf -c $ip6 -p 500$pc -t 3600 &
fi

if [ $pc -ne 7 ]; then
  iperf -c $ip7 -p 500$pc -t 3600 &
fi


echo "Programa finalizado."
