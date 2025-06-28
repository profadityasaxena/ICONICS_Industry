# Industrial SCADA Implementation with Mitsubishi ICONICS

## Overview

This repository documents an industry-grade **SCADA/HMI solution** developed using the **Mitsubishi ICONICS platform**, deployed across manufacturing operations for real-time visibility, control, and analytics. The system is composed of multiple modular sub-systems tailored to different production functions including quality, genealogy, order management, and shopfloor intelligence.

---

## 📦 Module Directory Structure

The implementation consists of the following major modules and script containers:

### 🔧 Core Functional Modules

- `007_MaterialManagement` – Material flow tracking and inventory reconciliation  
- `AMR` – Autonomous Mobile Robots interface (if integrated)  
- `Andon_Dwell_Time` – Real-time dwell time calculations for Andon systems  
- `Assembly Process` – Operator interface and logic for discrete assembly operations  
- `Genealogy` – Part traceability and batch-level genealogy  
- `OrderManagement` – Work order dispatch and production scheduling  
- `Configuration Download Popups` – UI controls for PLC/HMI configuration dispatch  
- `Heartbeat and Shopfloor` – System alive signals and machine runtime monitoring  
- `JH_PM` – Possibly Job Handling or Preventive Maintenance functions  
- `KitBin_KitRack_Screens_SP` – Custom screens for kitting and rack-based workflows  
- `Part_Life_AND_Tool_Life` – Lifespan monitoring for tools and part changeovers  
- `PingTest` – Diagnostic utility to test communication with edge devices  
- `PM_Screens_SP` – Specialized screens for Preventive Maintenance  
- `Quality` – Quality inspection, defect logging, and QA thresholds  
- `Reports` – Data aggregation and reporting templates (PDF/CSV)  
- `ScriptWorx` – Central logic scripts (ICONICS ScriptWorX engine)  
- `Single Line Popups` – On-screen modals for single-line production issues  
- `SKU_Equipment_Parameter_Mapping` – SKU-wise parameter mapping for equipment  
- `Test` – Development and validation sandbox  

---

### 📁 GDFX Graphic Files (HMI Screens)

These files represent ICONICS GraphWorX64 design files used in operator panels:

- `ANDON_Dwell_Time.gdfx`  
- `BajajMEA_HomeDisplay.gdfx`  
- `BajajMEA_Action_Configuration.gdfx`  
- `BajajMEA_Action_Configuration - Copy.gdfx`  

---

## 💻 Platform Details

- **HMI/SCADA Platform**: Mitsubishi ICONICS Suite  
- **Graphic Environment**: GraphWorX64 (.gdfx)  
- **Logic Engine**: ScriptWorX64  
- **Historian**: Hyper Historian (for long-term data)  
- **Alarm Management**: AlarmWorX64  
- **Protocol Integration**: OPC UA, Modbus, MQTT (if applicable)

---

## 🛠 Deployment Context

This implementation was deployed in a **manufacturing environment** requiring:

- Centralized **process monitoring** across stations  
- Configurable **HMI panels** for operators and supervisors  
- **Tool life and part life** alerts for proactive maintenance  
- **Order and material flow tracking** across stages  
- Visual **Andon and dwell-time analysis**  
- Embedded **scripts and popups** for interactivity and alerts

---

## 🚀 Getting Started

> This implementation is intended for licensed environments with Mitsubishi PLCs and ICONICS suite installed.

1. Deploy `.gdfx` files using GraphWorX64 or WebHMI runtime.
2. Connect to field devices using ICONICS Workbench with configured tags.
3. Activate ScriptWorX modules for automation logic.
4. Validate alarm and historian backends (AlarmWorX, Hyper Historian).
5. Integrate OPC UA clients or external MES systems as required.

---

## 📜 License

This repository documents a **proprietary industrial deployment**. Redistribution or commercial use is restricted without formal authorization.

---

## 📞 Contact

For implementation or consulting inquiries related to Mitsubishi ICONICS projects, please contact the system integrator or automation partner responsible for this deployment.
