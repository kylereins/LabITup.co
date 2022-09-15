# LabITup.co
## Repo for building LabITup.co, a fictitious company.

##### Simulated Scenario:
- ##Brown field deployment##, on-premise Microsoft Server environment, 1 campus/location, 10 business departments.
- ##Moving to Azure;##
  - build-and-destroy Azure resources (real-world cost cutting)

##### Bonus Integrations / Objectives:
- Offline Root-CA, Online Sub-CA(s), AD-integrated.


##### To-Do list:
- [x] Register domain name (LabITup.co): use actual TLD, for future-proofing and anti-MiTM
- [ ] Create on-prem AD environment:  DC, DHCP, RTR/Gateway
  - [x] Virtual Network setup: isolates DC/DNS/DHCP from home router/network for AD simulation.
  - [x] Build LIU-DHCP1: DHCP server
  - [x] Build LIU-DC1: Domain Controller
    - [ ] Populate w/ random names (PowerShell Script AD-User-Generator)
  - [ ] Build LIU-CAR1: Offline Root-CA



- [ ] Create Azure environment
  - [ ] Connect on-prem and Azure
  
  
- [ ] Insert automation here...


























