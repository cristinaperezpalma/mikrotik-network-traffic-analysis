#!/bin/bash

# Pedir información al usuario
read -p "En qué isla te encuentras: " Isla
read -p "A qué PC quieres enviar la información recogida por interfaz de gestión: " Pc



# Configuración para Router 1
Router1_IP="192.168.$Isla.11"
ssh -o StrictHostKeyChecking=no admin@$Router1_IP << EOF
# Mirar la ether del router que conecta directamente con los PCs.
# Mirar la ether del router que conecta directamente con los PCs.
ip traffic-flow set enabled=yes
ip traffic-flow set interfaces=ether2
ip traffic-flow set active-flow-timeout=1m
ip traffic-flow set inactive-flow-timeout=15s
ip traffic-flow target add dst-address=192.168.$Isla.$Pc port=5022 version=9
EOF
echo "Configuración completada para el router $Router1_IP."

# Configuración para Router 2
Router2_IP="192.168.$Isla.12"
ssh -o StrictHostKeyChecking=no admin@$Router2_IP << EOF
# Mirar la ether del router que conecta directamente con los PCs.
# Mirar la ether del router que conecta directamente con los PCs.
ip traffic-flow set enabled=yes
ip traffic-flow set interfaces=ether3
ip traffic-flow set active-flow-timeout=1m
ip traffic-flow set inactive-flow-timeout=15s
ip traffic-flow target add dst-address=192.168.$Isla.$Pc port=5022 version=9
EOF
echo "Configuración completada para el router $Router2_IP."

# Configuración para Router 3
Router3_IP="192.168.$Isla.13"
ssh -o StrictHostKeyChecking=no admin@$Router3_IP << EOF
# Mirar la ether del router que conecta directamente con los PCs.
ip traffic-flow set enabled=yes
ip traffic-flow set interfaces=ether2
ip traffic-flow set active-flow-timeout=1m
ip traffic-flow set inactive-flow-timeout=15s
ip traffic-flow target add dst-address=192.168.$Isla.$Pc port=5022 version=9
EOF
echo "Configuración completada para el router $Router3_IP."

