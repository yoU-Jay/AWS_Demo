resource "aws_instance" "ec2_instance" {
  ami                    = var.ami_name
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
  user_data              = file("./modules/ec2_server_module/install_tomcat.sh")

  tags = {
    Name = var.instance_name
  }

  depends_on = [aws_security_group.ec2_security_group]
}

resource "aws_security_group" "ec2_security_group" {
  name        = "ec2 security group"
  description = "allow access on ports 8090 and 22"
  vpc_id      = var.vpc_id

  ingress {
    description = "http access"
    from_port   = 8090
    to_port     = 8090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]

  }
}