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

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "my-alb-test"

  load_balancer_type = "application"

  vpc_id          = module.network_module.aws_vpc
  subnets         = ["subnet-0f1d27873c4699ff3", "subnet-0813388e5a895137a"]
  security_groups = [aws_security_group.alb.id]

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        my_target = {
          target_id = "i-01b726647c7628288"
          port      = 80
        }
        my_other_target = {
          target_id = "i-08100658f58302a40"
          port      = 80
        }
      }
    }
  ]
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Test"
  }
}