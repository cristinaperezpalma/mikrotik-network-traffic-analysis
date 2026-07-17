#!/bin/sh

PC=$1

if [ $PC -eq 1 ]
        then
     iperf -s -p 5002 -D&
     iperf -s -p 5003 -D&
     iperf -s -p 5004 -D&
     iperf -s -p 5005 -D&
     iperf -s -p 5006 -D&
     iperf -s -p 5007 -D&
elif [ $PC -eq 2 ]
	then
     iperf -s -p 5001 -D&
     iperf -s -p 5003 -D&
     iperf -s -p 5004 -D&
     iperf -s -p 5005 -D&
     iperf -s -p 5006 -D&
     iperf -s -p 5007 -D&
elif [ $PC -eq 3 ]
    then
     iperf -s -p 5002 -D&
     iperf -s -p 5001 -D&
     iperf -s -p 5004 -D&
     iperf -s -p 5005 -D&
     iperf -s -p 5006 -D&
     iperf -s -p 5007 -D&
elif [ $PC -eq 4 ]
	then
     iperf -s -p 5002 -D&
     iperf -s -p 5001 -D&
     iperf -s -p 5003 -D&
     iperf -s -p 5005 -D&
     iperf -s -p 5006 -D&
     iperf -s -p 5007 -D&
elif [ $PC -eq 5 ]
	then
     iperf -s -p 5002 -D&
     iperf -s -p 5001 -D&
     iperf -s -p 5004 -D&
     iperf -s -p 5003 -D&
     iperf -s -p 5006 -D&
     iperf -s -p 5007 -D&
elif [ $PC -eq 6 ]
	then
     iperf -s -p 5002 -D&
     iperf -s -p 5001 -D&
     iperf -s -p 5004 -D&
     iperf -s -p 5005 -D&
     iperf -s -p 5003 -D&
     iperf -s -p 5007 -D&
elif [ $PC -eq 7 ]
	then
     iperf -s -p 5002 -D&
     iperf -s -p 5001 -D&
     iperf -s -p 5004 -D&
     iperf -s -p 5005 -D&
     iperf -s -p 5006 -D&
     iperf -s -p 5003 -D&
else
    echo "Error"
fi

