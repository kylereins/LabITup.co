# LabITup.co
## Repo for building LabITup.co, a fictitious company.

##### Simulated Scenario:
- **Brown field deployment**, on-premise Microsoft Server environment, 1 campus/location, 10 business departments.
- **Moving to Azure;**
  - build-and-destroy Azure resources (real-world cost cutting)

##### Bonus Integrations / Objectives:
- Offline Root-CA, Online Sub-CA(s), AD-integrated.


##### To-Do list:
- [ ] Create on-prem AD environment:  DC, DHCP, RTR/Gateway
  - [x] Virtual Network setup: isolates DC/DNS/DHCP from home router/network for AD simulation.
  - [x] Build DHCP server: 
  - [x] Build Domain Controller:
    - [ ] Populate w/ random names (PowerShell Script AD-User-Generator.ps1)
  - [ ] Build Offline Root-CA
  - [ ] Build Win10 Client: install WAC (Windows Admin Center) for Admin emulation/duties

- [ ] Create Azure environment
  - [x] Register domain name (LabITup.co): use actual TLD, for future-proofing and anti-MiTM
  - [ ] Build Azure MG/Sub/RG (Mgt Grp, Subscription, Resource Group):  Decouple project from personal account 
  - [ ] Connect on-prem and Azure:  Azure-AD Synce server.
  
  
- [ ] Insert automation here...


























