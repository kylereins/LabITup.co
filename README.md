# LabITup.co
## Repo for building LabITup.co, a fictitious company.

##### Simulated Scenario:
- **Brown field deployment**, on-premise Microsoft Server environment, 1 dedicated host (extra laptop), 1 campus/location, 10 business departments.
- **Moving to Azure;**
  - build-and-destroy Azure resources (real-world cost cutting)

##### Bonus Integrations / Objectives:
- Azure Arc-joined server (laptop)
- Offline Root-CA, Online Sub-CA(s), AD-integrated.


##### *To-Do list:*
- [ ] Create on-prem AD environment:  DC, DHCP, RTR/Gateway
  - [x] Virtual Network setup: isolates DC/DNS/DHCP from home router/network for AD simulation.
  - [x] DHCP server and RTR
  - [x] Domain Controller: Basic configs (WinRM, IP), Enable AD Recycle Bin, unique admin accounts
    - [ ] Populate w/ random user accounts, OUs (PowerShell Script AD-User-Generator.ps1)
  - [x] Win10 Client: install/configure WAC (Windows Admin Center) for Admin emulation/duties
  - [x] Join Server 2019 host to Azure ARC
  - [ ] Offline Root-CA  

- [ ] Create Azure environment
  - [x] Build Azure ~~Mgt Grp~~, Subscription, Resource Group(s)):  Decouple project from personal account
  - [ ] Connect on-prem and Azure:  Azure-AD Sync server, possibly ADFS
  
- [ ] Public Facing company presence
  - [x] Register domain name (LabITup.co): use actual TLD
  - [x] Create Azure Tenant/Directory: new Global Admin; disconnect from personal account
  - [x] Create Static Website for www.LabITup.co:  Azure Static Web App
    - [x] Forward DNS registration (HTTPS/WWW) to Azure SWA
    - [x] GitHub Actions driving updates from Index.html file in this repo to Azure SWA
    - [ ] Fill Static Web App with actual content; low priority for lab purposes

  
- [ ] Insert testing/automation here...
  - [x] Script creation of random user accounts: See Scripts/AD-User-Generator.ps1
  - [ ] Script simulated usage of systems: user logons, file browsing, web browsing, etc to generate logs, usage, and such
  - [ ] Prometheus monitoring server
    - [ ] join AD
    - [ ] configure monitoring of VM's/containers
  - [ ] 


























