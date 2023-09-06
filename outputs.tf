output "ec2_instance_public_ip" {
  value = module.ec2_server_module.instance_public_ip
}

output "lb_dns_name" {
  value = module.alb.lb_dns_name
}