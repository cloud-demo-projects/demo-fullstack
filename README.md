
# Fullstack Application in AKS using Azure DevOps, IaC(Terraform & Bicep) & Helm Charts
This sample shows how to create/manage/deploy an AKS clusters with:
- Minimal React SPA frontend 
- Minimal Springboot API
- Standard docker pieline template
- Helm charts for release management into AKS cluster
- Terraform for IaC to build/change/destroy the k8 infrastructure
- Bicep for deploying the prerequiste storage account
- Hadolint for Dockerfile linting
- Aqua Trivy for image static scan
- Google container structure test
- Snyk repository scan- https://app.snyk.io/org/test-n5j
- Azure SQL PaaS connectivity

# Upcoming Features
- Ingress(manifest) for L7 loadbalancing
- Pod identity(Helm) setup for Azure SQL connectivity 
- Kured(Helm) for safe linux node reboots after patching
- Consuming static volume(manifest) in pod 
- Hashicorp integration(annotations) for secrets  
- Bicep IaC for Azure SQL server and database 

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
- Bicep (AZ CLI, VS code bicep extension)
- Java Static Code Analysis (Sonarcube, FindBugs, PMD)
- Dockerfile Linting (Hadolint)
- Docker Image Build Scan (Trivy) 
- Lens kubernetes IDE

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

