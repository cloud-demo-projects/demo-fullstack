
# Fullstack Application lifecycle in AKS using Azure DevOps, IaC(Terraform & Bicep), CI/CD & Helm
This sample shows how to create/manage/deploy an AKS clusters with:
- Minimal React SPA frontend 
- Springboot Microservices
- Standard docker pieline template including Hadolint for Dockerfile linting, Aqua Trivy for container image static scan & Google container structure test   for container images
- Standard bicep pipeline template for provisioning AKS prerequisite infrastructure 
- Terraform to deploy & destroy the AKS infrastructure
- Helm charts for application release management & Helmfile for additional cluster charts deployment 
- Snyk repository scan for vulneribilities
- Azure SQL PaaS connectivity
- Cluster Monitoring with Log analytics workspace, diagnostics, OMS agent and Application Insights Java agent 
- Ingress for L7 loadbalancing (Prerequisite- nginx ingress controller)
- Automated docker service endpoint creation
- Governence via Azure Policy & Gatekeeper

# Upcoming Enhancements
- Pod identity setup for Azure SQL connectivity 
- Bicep IaC for Azure SQL server and database 
- Modularize Terraform IaC
- Kustomize for release mmanagement
- Consuming static volume(manifest) in pod 
- Hashicorp secrets integration(annotations)  

# Prerequisites
Prerequisites are listed down for local development, CICD and IaC.

##  Local Dvelopment Tools
- JDK 11 ( For local java code compilation )
- Spring Tool Suite ( For Java code IDE )
- Node v14.17.5 ( For react package managment )
- VS Code ( React code IDE )
- Docker Desktop 4.7.0 ( For local conainter building & testing through Dockerfile )
- Terraform 1.1.8
- Kubernetes Cluster ( For local k8 cluster testing )
- Kubectl 1.22 ( For kubernetes cluster communication through command line )
- Azure CLI 2.32.0 ( For Azure subscription communication through command line )
- Helm 3.6.3 ( For Helm communication through command line )
- Azure SQL database with database server firewall opened up against client IP ( For local database development )
- Bicep (AZ CLI, VS code bicep extension)
- IDE plugin for code formatting
- Sonarlint/FindBugs/PMD (IDE Plugins For Java Static Code Analysis)
- Hadolint (Dockerfile Linting)
- Aqua Trivy (Docker Image Static Scan) 
- Lens (Kubernetes IDE)

## IaC with Principle of Least Privileges 
With principle of least privilidges the DevOps SPN is granted required delegations by the governing SPN (usually carrying the Owner rights)
- DevOps Service principle for Azure DevOps pipeline
- Server Service Principle/Managed Identity for cluster resources provisioning
- Client Service Principle for RBAC   
- SSH key for VM/node access
- Storage account for Terraform state
- Key Vault for secrets with SPN having GET access policy to secrets

## CI/CD 
- AKS Cluster with CNI, Managed Identity enabled and ACR integrated
- Docker Registry Service Connection
- Azure SQL database server firewall opened up through private endpoint against AKS VNet.

