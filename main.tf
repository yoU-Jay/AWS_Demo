module "network_module" {
  source   = "./modules/network_module"
  vpc_name = "NotDefault VPC"
}

module "ec2_server_module" {
  source        = "./modules/ec2_server_module"
  subnet_id     = module.network_module.aws_subnet
  vpc_id        = module.network_module.aws_vpc
  my_public_ip  = var.my_public_ip
  instance_name = var.instance_name
}