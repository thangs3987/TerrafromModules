# Terraform Demo Project: Azure VM + Networking + Datadog Integration

This demo sets up a modular, secure Azure environment with Datadog monitoring and CI/CD integration.

Folder Structure looks like below:

terraform-demo/
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── providers.tf
├── backend.tf
├── modules/
│   ├── network/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── compute/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── scripts/
│   └── install-datadog.sh
├── ci/
│   └── azure-pipelines.yml
├── .gitignore
├── .tflint.hcl
└── .pre-commit-config.yaml
