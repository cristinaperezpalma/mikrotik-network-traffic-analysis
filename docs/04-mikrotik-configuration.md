# MikroTik Configuration

## RouterOS Overview

MikroTik RouterOS is the core operating system used throughout the project. Each MikroTik router provides Layer 3 connectivity between the different LANs and backbone networks while also acting as a NetFlow exporter through the built-in Traffic Flow feature.

The routers are responsible for forwarding packets between subnets, exporting traffic statistics and providing remote management through SSH.

---

## Router Configuration

### Initial Configuration

Each router is configured according to the assigned laboratory island (`$Isla`). The addressing scheme is automatically adapted by using shell variables, allowing the same configuration scripts to be reused across different laboratory environments.

### Interfaces

The infrastructure separates management interfaces from production data interfaces.

| Router | Data Interface | Purpose |
|---------|----------------|---------|
| MKTx_1 | ether2 | LAN 1 |
| MKTx_2 | ether3 | LAN 2 |
| MKTx_3 | ether2 | LAN 3 |

Management interfaces belong to the independent `192.168.X.X` network and are used exclusively for administration.

### IP Configuration

Router interfaces use static IPv4 addressing.

- LAN gateways: `33.3.X.254`
- Backbone networks: `172.16.X.X` and `172.17.X.X`
- Management network: `192.168.X.X`

---

## Static Routing

Static routes are manually configured on every MikroTik router to provide connectivity between all LANs and backbone networks.

Each router forwards packets to the appropriate next-hop router according to the destination subnet.

The routing configuration is deterministic, meaning every destination network has a predefined path through the backbone infrastructure.

### RouterOS Commands

```routeros
/ip route add dst-address=<destination_network> gateway=<next_hop>
/ip route print
/ip route remove
```

---

## Traffic Flow (NetFlow)

Traffic monitoring is implemented using MikroTik Traffic Flow, which exports NetFlow Version 9 records to a Linux collector.

### Configuration

Traffic Flow is enabled on the router interfaces connected to the user LANs.

### Monitored Interfaces

- MKTx_1 → ether2
- MKTx_2 → ether3
- MKTx_3 → ether2

### Export Configuration

NetFlow records are exported to the collector through the management network.

| Parameter | Value |
|-----------|-------|
| Protocol | NetFlow v9 |
| Collector Port | 5022 |
| Active Flow Timeout | 1 minute |
| Inactive Flow Timeout | 15 seconds |

### RouterOS Commands

```routeros
/ip traffic-flow set enabled=yes
/ip traffic-flow set interfaces=ether2
/ip traffic-flow set active-flow-timeout=1m
/ip traffic-flow set inactive-flow-timeout=15s

/ip traffic-flow target add \
    dst-address=192.168.$Isla.$Pc \
    port=5022 \
    version=9
```

---

## SSH Management

All MikroTik routers are managed remotely through SSH using the independent management network.

This separation allows administrators to configure devices without affecting production traffic.

### SSH Command

```bash
ssh admin@192.168.$Isla.1X
```

---

## Bash Automation

The router configuration process is automated using several Bash scripts.

The automation performs the following tasks:

- Requests the laboratory island number.
- Generates the correct IP addressing.
- Connects to each MikroTik router through SSH.
- Executes RouterOS configuration commands remotely.
- Configures static routes.
- Enables NetFlow.
- Configures NetFlow collectors.
- Applies gateway configuration automatically.

The main automation scripts included in the project are:

- `tarearouters.sh`
- `gateway.sh`
- `configrouterscogerinfo.sh`
- `scriptNetflow.sh`

---

## Design Decisions

Several design decisions were adopted during the project:

- Static routing was selected to provide deterministic forwarding paths.
- Management traffic was isolated using an out-of-band management network.
- NetFlow was enabled directly on MikroTik routers to avoid deploying additional monitoring devices.
- Bash scripting was used to automate repetitive configuration tasks and reduce manual configuration errors.
- NetFlow Version 9 was selected to export flow statistics to Linux collectors for further processing.

---

## Configuration Summary

The MikroTik routers provide the core routing functionality of the laboratory network.

Their responsibilities include:

- Static IPv4 routing
- Gateway configuration
- Traffic Flow (NetFlow) monitoring
- SSH remote management
- Automated deployment through Bash scripts

Together, these configurations establish the routing infrastructure used throughout the project while providing the traffic data required for subsequent analysis and network optimization.
