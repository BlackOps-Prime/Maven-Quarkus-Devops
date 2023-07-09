output "proxy_servers_instance_ids" {
  value = aws_instance.proxy.*.id
}