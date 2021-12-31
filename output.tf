
output "ubuntu_consul_servers_private_addresses" {
    value = aws_instance.consul_servers.*.private_ip
}

output "consul_lb_dns" {
    value = aws_lb.consul_servers_alb.dns_name
}



