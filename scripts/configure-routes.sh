#!/bin/bash

# Solicitar la isla
echo "Introduce el número de la isla:"
read Isla

# Configuración de ROUTER MIKROTIK 1
ssh -o "StrictHostKeyChecking=no" admin@192.168.$Isla.11 <<EOF
ip route add dst-address=33.$Isla.2.0/24 gateway=172.16.$Isla.5
ip route add dst-address=33.$Isla.3.0/24 gateway=172.16.$Isla.3
quit
EOF

# Configuración de ROUTER 2
ssh -o "StrictHostKeyChecking=no" admin@192.168.$Isla.12 <<EOF
ip route add dst-address=33.$Isla.1.0/24 gateway=172.16.$Isla.4
ip route add dst-address=33.$Isla.3.0/24 gateway=172.16.$Isla.4
quit
EOF

# Configuración de ROUTER 3
ssh -o "StrictHostKeyChecking=no" admin@192.168.$Isla.13 <<EOF
ip route add dst-address=33.$Isla.1.0/24 gateway=172.16.$Isla.1
ip route add dst-address=33.$Isla.2.0/24 gateway=172.16.$Isla.5
quit
EOF

# Configuración de ROUTER 4
ssh -o "StrictHostKeyChecking=no" admin@192.168.$Isla.14 <<EOF
ip route add dst-address=33.$Isla.1.0/24 gateway=172.17.$Isla.5
ip route add dst-address=33.$Isla.2.0/24 gateway=172.16.$Isla.2
ip route add dst-address=33.$Isla.3.0/24 gateway=172.17.$Isla.5
quit
EOF

# Configuración de ROUTER 5
ssh -o "StrictHostKeyChecking=no" admin@192.168.$Isla.15 <<EOF
ip route add dst-address=33.$Isla.1.0/24 gateway=172.16.$Isla.1
ip route add dst-address=33.$Isla.2.0/24 gateway=172.17.$Isla.4
ip route add dst-address=33.$Isla.3.0/24 gateway=172.16.$Isla.3
quit
EOF

echo "Programa terminado."
