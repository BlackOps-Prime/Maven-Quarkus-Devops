resource "aws_ecs_cluster" "this" {
  name = "${var.global_var_tag_name}-${var.global_var_environment}-Cluster"

  setting {
    name  = "containerInsights"
    value = var.variable_ecs_container_insights
  }

  configuration {
    execute_command_configuration {
      logging = "OVERRIDE"

      log_configuration {
        cloud_watch_encryption_enabled = var.variable_ecs_log_configuration
        cloud_watch_log_group_name     = var.variable_ecs_log_group_name
      }
    }

  }

  tags = {
    Name = "${var.global_var_tag_name}-${var.global_var_environment}-cluster"
  }
}