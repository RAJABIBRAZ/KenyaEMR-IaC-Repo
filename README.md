# KenyaEMR Kubernetes Multi-Tenant IaC

Terraform + Helm deployment of KenyaEMR tenants on Kubernetes.

## ✅ Features
- Namespaced KenyaEMR deployment per tenant
- Ingress per tenant using `${tenant}.local`
- Helm chart-based deployment

## 🔧 Requirements
- Terraform
- Helm
- Kubernetes cluster
- NGINX Ingress controller
- Shared MySQL with per-tenant schemas

## 🚀 Usage

```bash
terraform init
terraform apply
