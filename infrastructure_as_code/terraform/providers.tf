provider "aws" {
  region = var.global_var_region

  profile                  = var.global_var_profile
  shared_config_files      = var.global_var_provider_shared_config
  shared_credentials_files = var.global_var_provider_shared_credentials

  default_tags {
    tags = {
      Env       = var.global_var_environment
      Terraform = true
    }

  }
}