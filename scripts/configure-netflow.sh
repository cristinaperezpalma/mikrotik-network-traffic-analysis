#!/bin/bash


#admin@192.168.1.11

ssh -o "StrictHostKeyChecking=no" admin@192.168.1.11 "/ip traffic-flow set enabled=yes" &
ssh -o "StrictHostKeyChecking=no" admin@192.168.1.11 "/ip traffic-flow set active-flow-timeout=1m" &
ssh -o "StrictHostKeyChecking=no" admin@192.168.1.11 "/ip traffic-flow set interface=ether2" &
ssh -o "StrictHostKeyChecking=no" admin@192.168.1.11 "/ip traffic-flow target add dst-address=192.168.1.1 port=5012 version=9" &


#admin@192.168.1.12

ssh -o "StrictHostKeyChecking=no" admin@192.168.1.12 "/ip traffic-flow set enabled=yes" &
ssh -o "StrictHostKeyChecking=no" admin@192.168.1.12 "/ip traffic-flow set active-flow-timeout=1m" &
ssh -o "StrictHostKeyChecking=no" admin@192.168.1.12 "/ip traffic-flow set interface=ether3" &
ssh -o "StrictHostKeyChecking=no" admin@192.168.1.12 "/ip traffic-flow target add dst-address=192.168.1.1 port=5012 version=9" &


#admin@192.168.1.13

ssh -o "StrictHostKeyChecking=no" admin@192.168.1.13 "/ip traffic-flow set enabled=yes" &
ssh -o "StrictHostKeyChecking=no" admin@192.168.1.13 "/ip traffic-flow set active-flow-timeout=1m" &
ssh -o "StrictHostKeyChecking=no" admin@192.168.1.13 "/ip traffic-flow set interface=ether2" &
ssh -o "StrictHostKeyChecking=no" admin@192.168.1.13 "/ip traffic-flow target add dst-address=192.168.1.1 port=5012 version=9" &

