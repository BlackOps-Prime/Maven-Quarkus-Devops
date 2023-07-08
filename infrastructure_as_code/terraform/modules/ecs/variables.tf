###### GLOBALS #######
variable "global_var_tag_name" {
  type        = string
  description = "Default Name Prefix of Resource"
}

variable "global_var_environment" {}

##### END GLOBALS ######

###### ECS MODULE VARIABLES SCTION #################
variable "variable_ecs_container_insights" {
  type        = string
  default     = "enabled"
  description = "Default switch for Container Insights for Cluster"
}

variable "variable_ecs_log_configuration" {
  type        = bool
  default     = true
  description = "Default switch for Cloudwatch Log COnfiguration for Cluster"
}

variable "variable_ecs_log_group_name" {
  type        = string
  description = "Default ecs cloudwatch log group name"
}

###### END ECS MODULE VARIABLES SECTION #######