# Traffic Monitoring and NetFlow Analysis

## Overview

Traffic monitoring was implemented to analyze network utilization, validate routing behavior, and obtain accurate traffic measurements for network planning and optimization.

The monitoring infrastructure combines MikroTik RouterOS Traffic Flow (NetFlow v9), Linux-based collection tools, automated traffic generation, and Python-based data processing. The collected information was later used to build traffic matrices and estimate the bandwidth required between different network segments.

---

## Monitoring Architecture

The monitoring system consists of four main components:

- **MikroTik Routers (MKTx_1, MKTx_2 and MKTx_3):** Export NetFlow v9 records.
- **Linux Collector:** Receives and stores exported flow records.
- **nfcapd:** Captures NetFlow packets and stores them as binary files.
- **nfdump:** Processes the captured files and exports traffic statistics.

The monitoring workflow is as follows:

1. Network traffic is generated using iPerf.
2. MikroTik routers monitor packets entering the LAN interfaces.
3. Traffic Flow exports NetFlow v9 records.
4. The Linux collector receives and stores the exported flows.
5. nfdump processes the binary files and generates CSV reports.
6. Python scripts analyze the resulting datasets and calculate traffic metrics.

---

## MikroTik Traffic Flow Configuration

Traffic Flow was enabled only on the routers connected to the LAN segments.

### Configuration Parameters

| Parameter | Value |
|-----------|-------|
| NetFlow Version | 9 |
| Active Flow Timeout | 1 minute |
| Inactive Flow Timeout | 15 seconds |
| Export Protocol | UDP |
| Destination Port | 5022 |
| Collector | 192.168.\$Isla.\$Pc |

Example RouterOS configuration:

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

## NetFlow Collection

The exported flow records were received by a Linux workstation using **nfcapd**.

Configuration:

- UDP Port: **5022**
- Binary storage format
- Automatic file rotation every **60 seconds**

Example command:

```bash
nfcapd -w -D \
-p 5022 \
-l /home/operador/Escritorio/nfcapd \
-t 60
```

This process was automated using the **nfcapd.sh** script.

---

## NetFlow Processing

After the traffic capture completed, the binary files were processed using **nfdump**.

The processing stage performs:

- Reading binary flow files.
- Filtering traffic by source and destination IP.
- Aggregating communication statistics.
- Exporting CSV datasets.

Example:

```bash
for file in /home/operador/Escritorio/nfcapd/nfcapd*
do
    nfdump -r "$file" \
    -o csv \
    -A srcip,dstip \
    '(src ip 33.3.1.1 or src ip 33.3.1.2) and (dst ip 33.3.2.3 or dst ip 33.3.2.4)' \
    >> /home/operador/Escritorio/flujos/Flujo_1_2
done
```

This task was automated through the **nfdump.sh** script.

---

## Traffic Generation

Traffic was generated using **iPerf** to simulate simultaneous communications between all network hosts.

Each workstation executed:

- Multiple iPerf servers.
- Multiple concurrent iPerf clients.
- Dedicated ports ranging from **5001 to 5007**.
- Continuous traffic sessions lasting **3600 seconds (1 hour)**.

Example commands:

```bash
iperf -s -D -p 5001

iperf -c 33.3.3.5 -p 5003 -t 3600 &
```

Traffic generation was automated using:

- **SERVIDOR.sh**
- **CLIENTE.sh**

---

## Traffic Analysis

The generated CSV files were analyzed using Python.

The analysis pipeline performs:

- CSV parsing.
- Time-series creation.
- Removal of anomalous samples.
- Traffic visualization.
- Average traffic calculation.
- 99th percentile calculation.

The implementation uses:

- NumPy
- Matplotlib
- Custom filtering functions

The generated graphs allow abnormal measurements and transient traffic peaks to be removed before calculating the final traffic matrices.

---

## Traffic Matrices

Two traffic matrices were generated from the processed NetFlow data.

### Average Traffic Matrix

The average traffic values were multiplied by two to estimate the required bandwidth while assuming approximately 50% link utilization.

| Origin | LAN 1 | LAN 2 | LAN 3 |
|--------|-------:|-------:|-------:|
| **LAN 1** | 0 | 364,103,237.87 | 183,845,406.33 |
| **LAN 2** | 3,090,703.84 | 0 | 311,933,227.32 |
| **LAN 3** | 193,168,705.87 | 596,626,915.30 | 0 |

---

### 99th Percentile Traffic Matrix

The 99th percentile provides a realistic estimation of peak traffic while avoiding over-dimensioning caused by isolated traffic bursts.

| Origin | LAN 1 | LAN 2 | LAN 3 |
|--------|-------:|-------:|-------:|
| **LAN 1** | 0 | 214,017,897.12 | 108,548,209.92 |
| **LAN 2** | 1,874,668.00 | 0 | 184,592,801.00 |
| **LAN 3** | 114,151,264.76 | 344,048,518.36 | 0 |

---

## Data Processing Workflow

The complete monitoring pipeline follows these steps:

1. Generate traffic using iPerf.
2. Capture packets using MikroTik Traffic Flow.
3. Export NetFlow v9 records.
4. Collect flows using nfcapd.
5. Process binary files using nfdump.
6. Export CSV datasets.
7. Analyze traffic using Python.
8. Generate traffic matrices for network optimization.

---

## Scripts Used

| Script | Description |
|----------|-------------|
| **configrouterscogerinfo.sh** | Configures Traffic Flow on MikroTik routers. |
| **scriptNetflow.sh** | Automates NetFlow configuration. |
| **nfcapd.sh** | Starts the NetFlow collector daemon. |
| **nfdump.sh** | Processes binary NetFlow files and exports CSV reports. |
| **SERVIDOR.sh** | Starts iPerf server instances. |
| **CLIENTE.sh** | Generates network traffic using iPerf clients. |

---

## Design Decisions

Several design choices were made during the monitoring phase:

- NetFlow v9 was selected because it is natively supported by MikroTik RouterOS.
- UDP port **5022** was dedicated exclusively to flow collection.
- Binary capture files were rotated every **60 seconds** to simplify post-processing.
- The **99th percentile** was used instead of maximum traffic values to avoid unnecessary over-dimensioning.
- Traffic was captured only on LAN-facing interfaces to prevent duplicate flow records.
- Python filtering functions removed transient peaks before computing traffic matrices.

---

## Summary

The implemented monitoring infrastructure combines MikroTik RouterOS, NetFlow v9, Linux collection tools, Bash automation, and Python-based analysis to obtain accurate traffic measurements.

The resulting traffic matrices provide the basis for the optimization stage, where GNU Octave and GLPK are used to determine the optimal bandwidth allocation across the network while minimizing infrastructure costs.
