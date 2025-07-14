variable "tenant_name" {
  description = "Tenant name"
  type        = string
}

variable "db_schema" {
  description = "Database schema for the tenant"
  type        = string
}

variable "db_host" {
  description = "MySQL database host"
  type        = string
  default     = "mysql.default.svc.cluster.local"
}

variable "db_user" {
  description = "Database username"
  type        = string
  default     = "openmrs"
}

variable "db_password" {
  description = "Database password"
  type        = string
  default     = "Admin123"
}

variable "chart_path" {
  description = "Path to the KenyaEMR Helm chart"
  type        = string
  }

variable "backend_image" {
  description = "Backend Docker image for the tenant"
  type        = string
  default     = "hakeemraj/kenyaemr-backend:latest"
}

variable "frontend_image" {
  description = "Frontend Docker image for the tenant"
  type        = string
  default     = "hakeemraj/kenyaemr-frontend:latest"
}
