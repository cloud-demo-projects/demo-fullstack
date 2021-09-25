
# Fullstack Application in AKS using Azure DevOps, Terraform & Helm Charts
This sample shows how to create/manage/deploy an AKS clusters with:
- Minimal React frontend 
- Spring boot API
- Azure SQL connectivity through Private Endpoint
- Helm charts used as release management into AKS cluster
- Terraform has been used as IaC to build/change the Azure infrastructure

# Prerequisites
Prerequisites are listed down for local development, CICD and IaC.

##  Local Dvelopment
- JDK 11 ( For local java code compilation )
- Spring Tool Suite ( For Java code IDE )
- Node v14.17.5 ( For react package managment )
- VS Code ( React code IDE )
- Docker ( For local conainter building & testing through Dockerfile )
- Kubernetes Cluster ( For local k8 cluster testing )
- Kubectl ( For kubernetes cluster communication through command line )
- Azure CLI ( For Azure subscription communication through command line )
- Helm 3.6.3 ( For Helm communication through command line )
- Azure SQL database with database server firewall opened up against client IP ( For local database development )

## CI/CD 
- AKS Cluster with CNI, Managed Identity enabled and ACR integrated
- Docker Registry Service Connection
- Azure SQL database server firewall opened up through private endpoint against AKS VNet.

## IaC
- Service principle for AKS & ACR provisioning through Terraform
- Service Principle/Managed Identity for cluster resource provisioning   
- SSH key for VM/node access
- Storage account for Terraform state
- Key Vault for secrets with SPN having GET access policy to SECRETS
