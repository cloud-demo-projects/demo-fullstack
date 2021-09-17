
# Project Detail
- Fullstack application including React SPA as frontend, SpringBoot API with ORM(Hibernate) and MySQL/Azure SQL database microservices.
- Docker containerization
- AKS Deployment through Helm charts

# Prerequisites

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
- SPN with AcrPull role on ACR (For Helm to pull chart from ACR)
- Azure SQL database server firewall opened up through private endpoint against AKS VNet.
