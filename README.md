
# Fullstack Application in AKS using Azure DevOps, IaC(Terraform & Bicep) & Helm Charts
This sample shows how to create/manage/deploy an AKS clusters with:
- Minimal React SPA frontend 
- Springboot API
- Standard docker pieline template
- Standard bicep pipeline template for provisioning AKS prerequisite infrastructure 
- Terraform to deploy/destroy the k8 infrastructure
- Helm charts for release management into AKS cluster
- Hadolint for Dockerfile linting
- Aqua Trivy for container image static scan
- Google container structure test for container images
- Snyk repository scan for vulneribilities - https://app.snyk.io/org/test-n5j
- Azure SQL PaaS connectivity

# Upcoming Features
- Enable logging for AKS https://docs.microsoft.com/en-us/azure/azure-monitor/containers/container-insights-enable-existing-clusters
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
- Docker Desktop 4.7.0 ( For local conainter building & testing through Dockerfile )
- Terraform 1.1.8
- Kubernetes Cluster ( For local k8 cluster testing )
- Kubectl ( For kubernetes cluster communication through command line )
- Azure CLI ( For Azure subscription communication through command line )
- Helm 3.6.3 ( For Helm communication through command line )
- Azure SQL database with database server firewall opened up against client IP ( For local database development )
- Bicep (AZ CLI, VS code bicep extension)
- Java Static Code Analysis (Sonarcube, FindBugs, PMD)
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

