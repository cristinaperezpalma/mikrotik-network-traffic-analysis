# MikroTik Network Traffic Analysis

An academic networking project focused on the deployment, configuration and analysis of a multi-router network infrastructure using MikroTik RouterOS.

The project combines static routing, NetFlow traffic monitoring, Linux networking tools, Python automation and traffic engineering techniques to analyze network behavior and optimize routing decisions based on measured traffic matrices.

---

# Project Overview

The objective of this project was to deploy and validate a laboratory network while learning traffic engineering concepts through real traffic measurements.

The infrastructure includes:

- Multi-router MikroTik topology
- Three interconnected LANs
- Static IPv4 routing
- Linux-based administration
- NetFlow v9 monitoring
- Traffic generation using iperf
- Python traffic analysis
- Traffic engineering
- Network optimization using GLPK and GNU Octave

---

# Features

- MikroTik RouterOS Configuration
- Static Routing
- IPv4 Addressing
- SSH Administration
- NetFlow v9 Monitoring
- Traffic Flow Export
- Linux Networking
- Traffic Generation with iperf
- Python Automation
- Network Traffic Analysis
- Traffic Matrix Processing
- Network Optimization

---

# Technologies

| Category | Technologies |
|-----------|--------------|
| Routing | MikroTik RouterOS |
| Monitoring | NetFlow v9, Traffic Flow |
| Network Tools | iperf, nfcapd, nfdump |
| Operating System | Ubuntu Linux |
| Automation | Bash |
| Programming | Python |
| Data Analysis | NumPy, Matplotlib |
| Optimization | GNU Octave, GLPK |
| Protocols | IPv4, SSH |

---

# Network Topology

Complete laboratory topology used throughout the project.

![Topology](screenshots/topology.png)

---

# Repository Structure

```
mikrotik-network-traffic-analysis/
│
├── docs/
│   ├── 01-project-overview.md
│   ├── 02-network-architecture.md
│   ├── 03-ip-addressing.md
│   ├── 04-mikrotik-configuration.md
│   ├── 05-network-services.md
│   ├── 06-traffic-monitoring.md
│   ├── 07-python-automation.md
│   ├── 08-network-validation.md
│
├── scripts/
│
├── screenshots/
│
├── README.md
└── LICENSE
```

---

# Documentation

| Document | Description |
|----------|-------------|
| 01 - Project Overview | Project objectives and scope |
| 02 - Network Architecture | Topology and devices |
| 03 - IP Addressing | IPv4 addressing plan |
| 04 - MikroTik Configuration | Routing and RouterOS configuration |
| 05 - Network Services | SSH, NetFlow and traffic generation |
| 06 - Traffic Monitoring | NetFlow monitoring and analysis |
| 07 - Python Automation | Scripts and traffic processing |
| 08 - Network Validation | Testing, troubleshooting and validation |

---

# Project Highlights

## Network Topology

Multi-router infrastructure deployed using MikroTik RouterOS.

![Topology](screenshots/topology.png)

---

## Static Routing

Manual routing configuration between interconnected routers.

![Routing](screenshots/routing.png)

---

## NetFlow Monitoring

Traffic Flow configured to export NetFlow v9 records to Linux collectors.

![NetFlow](screenshots/netflow.png)

---

## Traffic Analysis

Traffic processed using Python scripts to calculate averages and 99th percentile values.

![Python](screenshots/python-analysis.png)

---

## Traffic Engineering

Measured traffic matrices were later used to optimize routing decisions through GNU Octave and GLPK.

![Optimization](screenshots/optimization.png)

---

## Network Validation

Connectivity was validated using ping, traceroute and iperf.

![Validation](screenshots/validation.png)

---

# Learning Outcomes

This project provided hands-on experience with:

- MikroTik RouterOS
- Static Routing
- Linux Networking
- SSH Administration
- NetFlow Monitoring
- Traffic Engineering
- Python Automation
- Bash Scripting
- Network Optimization
- Performance Analysis

---

# Repository Contents

- Technical documentation
- MikroTik configuration
- Bash scripts
- Python scripts
- GNU Octave optimization
- Screenshots
- Network validation
