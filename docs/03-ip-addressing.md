# IP Addressing

## Overview

The network uses a structured IPv4 addressing scheme divided into three logical areas:

- User LANs
- Backbone transit networks
- Out-of-band management network

Each LAN uses a dedicated /24 subnet, while the backbone interconnects all MikroTik routers through separate transit networks. A dedicated management network allows administrators to configure devices independently from production traffic.

---

## IPv4 Addressing

The project uses IPv4 addressing throughout the entire infrastructure.

| Network | Address |
|----------|---------|
| User LANs | 33.3.X.0/24 |
| Backbone Network 1 | 172.16.X.0/24 |
| Backbone Network 2 | 172.17.X.0/24 |
| Management Network | 192.168.0.0/16 |
| External Connectivity | 220.10.10.0/24 |

User devices occupy the lower addresses of each subnet, while gateway interfaces use the `.254` address.

---

## LAN Networks

### LAN 1

- Subnet: `33.3.1.0/24`
- Default Gateway: `33.3.1.254`
- Router: `MKTx_1`
- Hosts:
  - PCX_1
  - PCX_2

### LAN 2

- Subnet: `33.3.2.0/24`
- Default Gateway: `33.3.2.254`
- Router: `MKTx_2`
- Hosts:
  - PCX_3
  - PCX_4

### LAN 3

- Subnet: `33.3.3.0/24`
- Default Gateway: `33.3.3.254`
- Router: `MKTx_3`
- Hosts:
  - PCX_5
  - PCX_6
  - PCX_7

---

## Backbone Networks

The routers are interconnected using dedicated transit networks.

| Network | Purpose |
|----------|---------|
| 172.16.X.0/24 | Backbone transit |
| 172.17.X.0/24 | Backbone transit |
| 220.10.10.0/24 | External connection to other islands |

These networks transport traffic between routers and connect the local infrastructure to external laboratory networks.

---

## Management Network

A dedicated out-of-band (OOB) management network is used for device administration.

### Management Addresses

| Device | Management IP |
|---------|---------------|
| MKTx_1 | 192.168.X.11 |
| MKTx_2 | 192.168.X.12 |
| MKTx_3 | 192.168.X.13 |
| MKTx_4 | 192.168.X.14 |
| MKTx_5 | 192.168.X.15 |
| MKTx_6 | 192.168.X.16 |
| Eihal Server | 192.168.33.21 |

The management network is used exclusively for SSH access and device administration.

---

## VLAN Addressing

| VLAN | Subnet | Purpose |
|------|--------|---------|
| VLAN201 | 33.3.1.0/24 | LAN 1 |
| VLAN202 | 33.3.2.0/24 | LAN 2 |
| VLAN203 | 33.3.3.0/24 | LAN 3 |
| VLAN204 | 172.16.X.0/24 | Backbone |
| VLAN205 | 172.17.X.0/24 | Backbone |
| VLAN206 | 220.10.10.0/24 | External connectivity |

---

## Default Gateways

Each LAN uses a dedicated gateway located on its corresponding MikroTik router.

| LAN | Gateway |
|-----|----------|
| LAN 1 | 33.3.1.254 |
| LAN 2 | 33.3.2.254 |
| LAN 3 | 33.3.3.254 |

The default gateway allows hosts to communicate with remote networks through the routing infrastructure.

---

## Interface Addressing

The infrastructure separates management and production interfaces.

### Management Interfaces

- Private addressing (`192.168.X.X`)
- SSH administration
- Device configuration
- Remote management

### Data Interfaces

| Router | Interface | Connected Network |
|---------|-----------|-------------------|
| MKTx_1 | ether2 | VLAN201 |
| MKTx_2 | ether3 | VLAN202 |
| MKTx_3 | ether2 | VLAN203 |

These interfaces transport production traffic between hosts and routers.

---

## Addressing Summary

| Network | Subnet | Gateway | Devices | Purpose |
|----------|---------|----------|----------|---------|
| LAN 1 | 33.3.1.0/24 | 33.3.1.254 | PCX_1, PCX_2, MKTx_1 | User network |
| LAN 2 | 33.3.2.0/24 | 33.3.2.254 | PCX_3, PCX_4, MKTx_2 | User network |
| LAN 3 | 33.3.3.0/24 | 33.3.3.254 | PCX_5, PCX_6, PCX_7, MKTx_3 | User network |
| Backbone 1 | 172.16.X.0/24 | Variable | MKTx_1–MKTx_5 | Router interconnection |
| Backbone 2 | 172.17.X.0/24 | Variable | MKTx_4–MKTx_6 | Router interconnection |
| External Network | 220.10.10.0/24 | Variable | MKTx_6 | External connectivity |
| Management | 192.168.0.0/16 | N/A | All routers, Eihal | Device management |
