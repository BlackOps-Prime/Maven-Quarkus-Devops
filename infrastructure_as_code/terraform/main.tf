# Author: Christopher Junior Afeku
# Description: A Terraform script to create the required resources according to the requirements of the attached architecture Diagram for this project.
# Usage:
#   * Initialize the project
#   * Run `terraform plan` to and validate the printed out results.
#   * Run `terraform apply` to create the resources for the underlying infrastructure.
#   * You may also run `terraform apply` to update the deployed resources after making needed changes to this iac project.
# Last Modified: 8th July, 2023

module "networking" {
  source = "./modules/networking"

  global_var_environment = var.global_var_environment
  global_var_tag_name    = var.global_var_tag_name
}

module "ecs" {
  source                      = "./modules/ecs"
  global_var_tag_name         = var.global_var_tag_name
  global_var_environment      = var.global_var_environment
  variable_ecs_log_group_name = module.logging.ecs_cluster_log_group_name
}

module "logging" {
  source                             = "./modules/logging"
  global_var_tag_name                = var.global_var_tag_name
  global_var_environment             = var.global_var_environment
  variable_ecs_log_group_name_prefix = "${var.global_var_tag_name}-Cluster-log-group"

}