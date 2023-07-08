output "ecs_cluster_log_group_name" {
  value       = aws_cloudwatch_log_group.ecs_cluster_log_group.name
  description = "Export ECS Cluster Cloudwatch log group name for other modules to consume"
}
