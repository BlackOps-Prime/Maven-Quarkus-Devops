resource "aws_ecs_cluster" "this" {
  name               = "Maven-Quarkus-Cluster"

  tags = {
    Name = "${var.global_var_tag_name}-cluster"
  }
}