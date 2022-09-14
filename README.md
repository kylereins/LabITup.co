# LabITup.co
Repo for building LabITup.co, a fictitious company.

Simulated Scenario:
- Brown field deployment, on-premise Microsoft Server environment.  
- Moving to Azure;
  - build-and-destroy Azure resources (real-world cost cutting)

Bonus Integrations / Objectives:
- Offline Root-CA, Online Sub-CA(s), AD-integrated.


To-Do list:
- [x] Register domain name (LabITup.co): use actual TLD, for future-proofing and anti-MiTM
- [ ] Create on-prem AD environment:  DC, DHCP, RTR/Gateway
  - [x] Virtual Network setup: isolates DC/DNS/DHCP from home router/network for AD simulation.
  - [ ] Build LIU-DC1: Domain Controller
  - [ ] Build LIU-CAR1: Offline Root-CA
  - [ ] Build LIU-DHCP1: DHCP server


- [ ] Create Azure environment
  - [ ] Connect on-prem and Azure
  
  
- [ ] Insert automation here...


























