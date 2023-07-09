# Author: Christopher Junior Afeku
# Description: A Terraform script to create the required resources according to the requirements of the attached architecture Diagram for this project.
# Usage:
#   * Initialize the project
#   * Run `terraform plan` to and validate the printed out results.
#   * Run `terraform apply` to create the resources for the underlying infrastructure.
#   * You may also run `terraform apply` to update the deployed resources after making needed changes to this iac project.
# Last Modified: th July, 2023

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

  depends_on = [ module.logging ]
}

module "logging" {
  source                             = "./modules/logging"

  global_var_tag_name                = var.global_var_tag_name
  global_var_environment             = var.global_var_environment
  variable_ecs_log_group_name_prefix = "${var.global_var_tag_name}-Cluster-log-group"
}

module "ec2" {
  source    = "./modules/ec2"

  count             = var.variable_instance_count
  global_var_tag_name                = var.global_var_tag_name
  global_var_environment             = var.global_var_environment
  variable_instance_security_groups = module.networking.public_subnets_security_groups
  variable_instance_public_subnet_ids = element(module.networking.public_subnets_ids, count.index)

  depends_on = [ module.networking ]
}

module "loadbalancing" {
  source = "./modules/loadbalancing"

  variable_public_subnets = module.networking.public_subnets_ids
  variable_private_subnets = module.networking.private_subnets_ids
  global_var_tag_name                = var.global_var_tag_name
  global_var_environment             = var.global_var_environment
  variable_internal_loadbalancer_security_group = module.networking.internal_load_balancer_security_group
  variable_vpc_id = module.networking.main_vpc_id
  count   =  var.variable_instance_count
  variable_alb_proxy_target_group_instance_targets = element(module.ec2[count.index].proxy_servers_instance_ids, count.index)
}