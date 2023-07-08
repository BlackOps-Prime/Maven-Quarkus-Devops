variable "variable_ecs_log_retention_days" {
  type        = number
  default     = 30
  description = "Default log retention period for cloudwatch logs"
}

variable "variable_ecs_log_group_name_prefix" {
  type        = string
  description = "Default name prefix for ecs log group"
}

variable "global_var_tag_name" {}

variable "global_var_environment" {}