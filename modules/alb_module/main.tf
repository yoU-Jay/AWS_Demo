resource "aws_security_group" "alb" {
  name        = "terraform_alb_security_group"
  description = "Terraform ALB security group"
  vpc_id      = module.network_module.aws_vpc

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = "terraform-example-alb-security-group"
  }
}