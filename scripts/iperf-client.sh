#!/bin/sh

PC=$1

if [ $PC -eq 1 ]
     then
      iperf -c 33.1.1.2 -p 5001 -t 8000&
      iperf -c 33.1.2.3 -p 5001 -t 8000&
      iperf -c 33.1.2.4 -p 5001 -t 8000&
      iperf -c 33.1.3.5 -p 5001 -t 8000&
      iperf -c 33.1.3.6 -p 5001 -t 8000&
      iperf -c 33.1.3.7 -p 5001 -t 8000&
elif [ $PC -eq 2 ]
     then
      iperf -c 33.1.1.1 -p 5002 -t 8000&
      iperf -c 33.1.2.3 -p 5002 -t 8000&
      iperf -c 33.1.2.4 -p 5002 -t 8000&
      iperf -c 33.1.3.5 -p 5002 -t 8000&
      iperf -c 33.1.3.6 -p 5002 -t 8000&
      iperf -c 33.1.3.7 -p 5002 -t 8000&
elif [ $PC -eq 3 ]
     then
      iperf -c 33.1.1.2 -p 5003 -t 8000&
      iperf -c 33.1.1.1 -p 5003 -t 8000&
      iperf -c 33.1.2.4 -p 5003 -t 8000&
      iperf -c 33.1.3.5 -p 5003 -t 8000&
      iperf -c 33.1.3.6 -p 5003 -t 8000&
      iperf -c 33.1.3.7 -p 5003 -t 8000&
elif [ $PC -eq 4 ]
     then
      iperf -c 33.1.1.2 -p 5004 -t 8000&
      iperf -c 33.1.2.3 -p 5004 -t 8000&
      iperf -c 33.1.1.1 -p 5004 -t 8000&
      iperf -c 33.1.3.5 -p 5004 -t 8000&
      iperf -c 33.1.3.6 -p 5004 -t 8000&
      iperf -c 33.1.3.7 -p 5004 -t 8000&
elif [ $PC -eq 5 ]
     then
      iperf -c 33.1.1.2 -p 5005 -t 8000&
      iperf -c 33.1.2.3 -p 5005 -t 8000&
      iperf -c 33.1.2.4 -p 5005 -t 8000&
      iperf -c 33.1.1.1 -p 5005 -t 8000&
      iperf -c 33.1.3.6 -p 5005 -t 8000&
      iperf -c 33.1.3.7 -p 5005 -t 8000&
elif [ $PC -eq 6 ]
     then
      iperf -c 33.1.1.2 -p 5006 -t 8000&
      iperf -c 33.1.2.3 -p 5006 -t 8000&
      iperf -c 33.1.2.4 -p 5006 -t 8000&
      iperf -c 33.1.3.5 -p 5006 -t 8000&
      iperf -c 33.1.1.1 -p 5006 -t 8000&
      iperf -c 33.1.3.7 -p 5006 -t 8000&
elif [ $PC -eq 7  ]
     then
      iperf -c 33.1.1.2 -p 5007 -t 8000&
      iperf -c 33.1.2.3 -p 5007 -t 8000&
      iperf -c 33.1.2.4 -p 5007 -t 8000&
      iperf -c 33.1.3.5 -p 5007 -t 8000&
      iperf -c 33.1.3.6 -p 5007 -t 8000&
      iperf -c 33.1.1.1 -p 5007 -t 8000&
else
	echo "Error"
fi
