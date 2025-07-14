provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

module "mysql_shared" {
  source = "./modules/mysql-shared"
}

module "mbagathiemr" {
  source        = "./modules/kenyaemr-tenant"
  chart_path    = "${path.module}/charts/kenyaemr-tenant"  

  tenant_name    = "mbagathicrh"
  db_schema      = "openmrs_mbagathicrh"
  db_host        = "mysql.default.svc.cluster.local"
  db_user        = "mbagathi_user"
  db_password    = "mbagathi_pass"
  backend_image  = "hakeemraj/kenyaemr-backend:latest"
  frontend_image = "hakeemraj/kenyaemr-frontend:latest"
}

module "kayoleemr" {
  source        = "./modules/kenyaemr-tenant"
  chart_path    = "${path.module}/charts/kenyaemr-tenant" 

  tenant_name    = "kayolesch"
  db_schema      = "openmrs_kayolesch"
  db_host        = "mysql.default.svc.cluster.local"
  db_user        = "kayole_user"
  db_password    = "kayole_pass"
  backend_image  = "hakeemraj/kenyaemr-backend:latest"
  frontend_image = "hakeemraj/kenyaemr-frontend:latest"
}





# Add more tenants here...
