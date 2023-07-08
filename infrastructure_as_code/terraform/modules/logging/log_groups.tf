resource "aws_cloudwatch_log_group" "ecs_cluster_log_group" {
  name_prefix       = var.variable_ecs_log_group_name_prefix
  retention_in_days = var.variable_ecs_log_retention_days

  tags = {
    Name = "${var.global_var_tag_name}-${var.global_var_environment}-log-group"
  }

}