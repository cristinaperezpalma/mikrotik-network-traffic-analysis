#!/bin/sh

echo "¿Que PC desea configurar?(1-7)"

read PC

if [ $PC -eq "1" -a $PC -eq "2" ]
	then
		sudo route add -net 33.1.2.0/24 gw 33.1.1.254
		sudo route add -net 33.1.3.0/24 gw 33.1.1.254
elif [ $PC -eq "3" -a $PC -eq "4" ]
	then
		sudo route add -net 33.1.1.0/24 gw 33.1.2.254
		sudo route add -net 33.1.3.0/24 gw 33.1.2.254
elif [ $PC -eq "5" -a $PC -eq "6" -a $PC -eq "7" ]
	then
		sudo route add -net 33.1.1.0/24 gw 33.1.3.254
		sudo route add -net 33.1.2.0/24 gw 33.1.3.254
fi
