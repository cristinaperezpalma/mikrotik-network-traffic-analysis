# Project Overview

## Project Objective

The objective of this project is to deploy, configure, monitor and analyze a routed network infrastructure using MikroTik RouterOS. The project combines manual network configuration with automation scripts, NetFlow traffic monitoring, Python-based traffic analysis and traffic engineering techniques to evaluate network performance and optimize resource allocation.

---

## Problem Statement

The project addresses several networking challenges in a laboratory environment without Internet connectivity:

- Deploying and configuring a complete routed network using MikroTik devices.
- Automating repetitive network configuration tasks.
- Monitoring network traffic using NetFlow.
- Processing and analyzing collected traffic data.
- Optimizing network capacity based on measured traffic matrices instead of theoretical estimations.

---

## Project Scope

The project covers the complete workflow of a small routed network, including:

- Network deployment.
- Static routing configuration.
- Linux network administration.
- SSH-based remote management.
- NetFlow traffic collection.
- Traffic generation with iperf.
- Python-based traffic analysis.
- Traffic engineering using GNU Octave and GLPK.

---

## Project Goals

The main goals of the project are:

- Deploy a functional routed laboratory network.
- Configure static IPv4 routing between multiple LANs.
- Automate router configuration using Bash scripts.
- Generate network traffic for testing purposes.
- Capture traffic flows using NetFlow v9.
- Process collected traffic using Python.
- Build traffic matrices from real measurements.
- Optimize network capacity using linear programming techniques.

---

## Laboratory Environment

The project was developed in a laboratory environment without Internet access. Software packages were obtained from a local repository server, while Linux hosts, MikroTik routers and traffic generation tools were used to simulate a production-like network.

---

## Main Components

The infrastructure includes:

- MikroTik RouterOS routers.
- Multiple Linux client hosts.
- Local repository server (Eihal).
- SSH remote administration.
- NetFlow Traffic Flow.
- iperf traffic generation.
- nfcapd and nfdump collectors.
- Python traffic analysis scripts.
- GNU Octave and GLPK optimization tools.

---

## Expected Outcomes

After completing the project, the following objectives were achieved:

- Successful deployment of a routed MikroTik network.
- Automated router configuration through Bash scripts.
- End-to-end traffic monitoring using NetFlow.
- Generation and processing of traffic matrices.
- Statistical traffic analysis using Python.
- Network optimization through linear programming.
