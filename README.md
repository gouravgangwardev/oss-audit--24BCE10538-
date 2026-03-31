# SS Capstone Project — The Open Source Audit

**Student Name:** Gourav Gangwar
**Roll Number:** 24BCE10538
**Course:** Open Source Software
**Chosen Software:** Python

---

## About This Project

This project is a structured audit of **Python**, an open-source programming language created by Guido van Rossum in 1989 and licensed under the **Python Software Foundation (PSF) License**.

The audit explores Python's open-source ecosystem through a series of shell scripts that inspect the system environment, verify the software installation, analyse logs, and generate personalised open-source content.

---

## Shell Scripts

| Script | File | What it does |
|--------|------|--------------|
| Script 1 | `script1_system_identity.sh` | Displays Linux system info — kernel, user, uptime, OS, and a license message |
| Script 2 | `script2_package_inspector.sh` | Checks if Python is installed, shows its version and license, and prints a philosophy note |
| Script 3 | `script3_disk_auditor.sh` | Audits key system directories for permissions, owner, and disk usage |
| Script 4 | `script4_log_analyzer.sh` | Reads a log file, counts keyword occurrences, and shows the last 5 matches |
| Script 5 | `script5_manifesto_generator.sh` | Asks 3 interactive questions and generates a personalised open-source manifesto |

---

## Dependencies Required

| Dependency | Purpose | Install Command |
|------------|---------|-----------------|
| Bash | Shell interpreter (pre-installed on all Linux systems) | — |
| Python 3 | Required for Script 2 (package inspection) | `sudo apt install python3` (Debian/Ubuntu) |
| coreutils | Standard Linux tools: `ls`, `du`, `df`, `uptime` (pre-installed) | — |
| grep / awk | Used in log analysis scripts (pre-installed) | — |

---

## How to Run Each Script on Linux

### Requirements

- A Linux system (Ubuntu/Debian or RHEL/Fedora)
- Python 3 installed: `sudo apt install python3`
- Bash shell (comes pre-installed on all Linux systems)
- Must be inside the cloned GitHub repository

### Step 1 — Clone the Repository

```bash
git clone <your-repo-url>
cd <repo-folder>
```

### Step 2 — Make Scripts Executable

Run this once to grant execute permissions to all scripts:

```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto_generator.sh
```

### Step 3 — Run Each Script

**Script 1 — System Identity**
```bash
./script1_system_identity.sh
```
Displays your Linux kernel version, logged-in user, system uptime, OS details, and a license message.

---

**Script 2 — Package Inspector**
```bash
./script2_package_inspector.sh
```
Checks whether Python 3 is installed, prints the installed version, displays the PSF license summary, and outputs Python's philosophy (the Zen of Python).

---

**Script 3 — Disk Auditor**
```bash
./script3_disk_auditor.sh
```
Audits key system directories (`/home`, `/var`, `/etc`, `/tmp`) — reports file permissions, ownership, and disk usage for each.

---

**Script 4 — Log Analyser**
```bash
./script4_log_analyzer.sh
```
Reads a specified log file, counts how many times defined keywords appear, and displays the last 5 matching lines. You may be prompted to provide a log file path (e.g. `/var/log/syslog`).

---

**Script 5 — Manifesto Generator**
```bash
./script5_manifesto_generator.sh
```
An interactive script that asks you 3 questions about your open-source values and generates a personalised open-source manifesto based on your answers.

---

## Notes

- All scripts are written in Bash and tested on Ubuntu 22.04 LTS.
- Script 2 requires Python 3 to be installed prior to running.
- Script 4 may require `sudo` permissions if reading protected log files (e.g. `/var/log/auth.log`).
- No external third-party libraries are needed beyond standard Linux utilities.

---

*Submitted as part of the Open Source Software course audit assignment.*
