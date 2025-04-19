terraform {
  required_providers {
    snowflake = {
      source  = "snowflake-Labs/snowflake"
      version = "~> 0.87"
    }
  }
}

provider "snowflake" {
  alias      = "accountadmin"
  role       = "ACCOUNTADMIN"
  account_name      = var.snowflake_account_name
  organization_name = var.snowflake_organization_name
  user              = var.snowflake_user
  password          = var.snowflake_password
}

provider "snowflake" {
  alias      = "sysadmin"
  role       = "SYSADMIN"
  account_name      = var.snowflake_account_name
  organization_name = var.snowflake_organization_name
  user              = var.snowflake_user
  password          = var.snowflake_password
}

provider "snowflake" {
  alias  = "security_admin"
  role   = "SECURITYADMIN"
  account_name      = var.snowflake_account_name
  organization_name = var.snowflake_organization_name
  user              = var.snowflake_user
  password          = var.snowflake_password
}

module "roles" {
  source = "./modules/roles"

  providers = {
    snowflake.sysadmin       = snowflake.sysadmin
    snowflake.security_admin = snowflake.security_admin
  }
}