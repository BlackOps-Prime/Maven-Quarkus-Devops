# Author: Christopher Junior Afeku
# Description: A Terraform script to create the required resources according to the requirements of the attached architecture Diagram for this project.
# Usage:
#   * Initialize the project
#   * Run `terraform plan` to and validate the printed out results.
#   * Run `terraform apply` to create the resources for the underlying infrastructure.
#   * You may also run `terraform apply` to update the deployed resources after making needed changes to this iac project.


provider "aws" {
  region = var.global_var_region

  profile                  = var.global_var_profile
  shared_config_files      = ["/Users/christopher.afeku/.aws/config"]
  shared_credentials_files = ["/Users/christopher.afeku/.aws/credentials"]

  default_tags {
    tags = {
      Env       = var.global_var_environment
      Terraform = true
    }

  }
}

module "networking" {
  source = "./modules/networking"

  global_var_environment = var.global_var_environment
  global_var_tag_name    = var.global_var_tag_name

}