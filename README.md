🏗️ Azure Infrastructure with Terraform & CI/CD Pipelines
A production-ready DevOps Infrastructure repository designed to deploy modular Azure resources using Terraform, fully integrated with automated CI/CD pipelines.

This project bridges the gap between Infrastructure as Code (IaC) and Automated Delivery, featuring environment isolation (Dev/Prod) and reusable pipeline templates for both infrastructure and application deployment.

🚀 Key Features
✅ Environment Isolation: Dedicated configuration for environments (e.g., environment/dev) to ensure safe state management.

✅ Automated CI/CD: Pre-configured GitHub Actions (.github/workflows) and reusable pipeline templates.

✅ Modular Architecture: Decoupled modules/ directory for reusable Azure components.

✅ Pipeline-as-Code: YAML-defined stages for Infrastructure (infra-*-pipeline.yml) and Applications (application-*-pipeline.yml).

✅ Secure State Management: Configured for remote state locking via provider.tf.

📂 Repository Structure
```
Root/
├── .github/workflows/          # CI/CD Trigger Definitions
│   ├── dev.yml                 # Pipeline trigger for Development branch
│   └── main.yml                # Pipeline trigger for Production/Main branch
│
├── environment/                # Environment-Specific Configurations
│   └── dev/                    # Development Environment Entry Point
│       ├── main.tf             # Root configuration invoking modules
│       ├── provider.tf         # Azure Provider & Backend setup
│       ├── terraform.tfvars    # Environment specific variable values
│       └── variable.tf         # Variable definitions
│
├── modules/                    # Reusable Terraform Modules (Compute, Network, etc.)
│       └── azurerm_bastion
        ├── azurerm_containser_registory
        ├── azurerm_keyvault
        ├── azurerm_kubernets_cluster
        ├── azurerm_managed_identity
        ├── azurerm_public_ip
        ├── azurerm_resource_group
        ├── azurerm_sql_database
        ├── azurerm_sql_server
        ├── azurerm_storage_account
        ├── azurerm_subnet
        └── azurerm_virtual_machine
azurerm_virtual_network
├── application-job-pipelines.yml   # Reusable job template for App Deployment
├── application-stage-pipeline.yml  # Stage orchestration for Apps
├── infra-job-pipelines.yml         # Reusable job template for Terraform (Plan/Apply)
├── infra-stage-pipeline.yml        # Stage orchestration for Infrastructure
└── .gitignore                      # Git ignore rules

```
🧩 Workflow Overview🔹 1. Environment Configuration (environment/)Instead of a monolithic file, this repo uses directory-based environments.environment/dev: Contains the state, variables, and provider configuration specific to the Development environment.Scalability: Easily add environment/prod or environment/staging by copying the folder structure.🔹 2. CI/CD Pipelines (.github/ & Root YAMLs)This repository uses a template-based approach to pipelines:dev.yml / main.yml: The entry points that trigger on git push.infra-*-pipelines.yml: Handles terraform init, plan, and apply logic.application-*-pipelines.yml: Handles application code build and deployment logic (decoupled from infra).⚙️ Prerequisites✅ Terraform >= 1.5✅ Azure CLI (az login)✅ GitHub Secrets configured (Client ID, Secret, Tenant ID, Subscription ID)✅ Azure Storage Account (for remote backend state)🖥️ Local Setup (Manual Deployment)To run the infrastructure locally for development purposes:Step 1: Clone RepositoryBashgit clone https://github.com/<your-username>/azure-terraform-cicd.git
cd azure-terraform-cicd
Step 2: Navigate to EnvironmentYou must run commands from the specific environment directory, not the root.Bashcd environment/dev
Step 3: Initialize & ValidateBashterraform init
terraform validate
Step 4: Plan InfrastructureBashterraform plan -var-file="terraform.tfvars"
Step 5: ApplyBashterraform apply -var-file="terraform.tfvars" -auto-approve
☁️ CI/CD Workflow StrategyThis repository is designed for GitOps.Workflow FileTriggerActiondev.ymlPush to dev branchRuns terraform plan and apply on the Dev environment.main.ymlPush to main branchRuns terraform plan and apply on the Prod environment (usually with approval gates).Pipeline Secrets Required:ARM_CLIENT_IDARM_CLIENT_SECRETARM_SUBSCRIPTION_IDARM_TENANT_ID🔐 Security Best Practices❌ Never commit .tfvars containing real secrets.❌ Never commit .terraform.lock.hcl if you change OS platforms frequently (though recommended for consistency).✅ Use Remote Backend in provider.tf to store state securely in Azure Blob Storage.✅ Use Managed Identities where possible for VM permissions.📄 .gitignore RulesThe included .gitignore ensures the following are excluded:Plaintext# Local .terraform directories
**/.terraform/*

# .tfstate files
*.tfstate
*.tfstate.*

# Crash logs
crash.log

# Sensitive variable files
*.tfvars
# 👨‍💻 Author

**Anmol Sharma**  
🔗 [LinkedIn](https://www.linkedin.com/in/anmol-sharma-7b3506246/)
🔗 Next StepsIf you want next, I can:Document the specific logic inside the infra-job-pipelines.yml.Create a diagram showing how the GitHub Workflow calls the separate YAML templates.Add a "How to add a new Environment" guide.Just say the word! 🚀
