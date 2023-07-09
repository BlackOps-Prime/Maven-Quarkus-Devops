output "public_subnets_ids" {
  value = aws_subnet.public.*.id
}


output "private_subnets_ids" {
  value = aws_subnet.private.*.id
}


output "public_subnets_security_groups" {
  value = aws_security_group.public.*.id
}

output "external_load_balancer_security_group" {
  value = aws_security_group.ext_loadbalancer.*.id
}

output "internal_load_balancer_security_group" {
  value = aws_security_group.internal_load_balancer.*.id
}

output "main_vpc_id" {
  value = aws_vpc.this.id
}