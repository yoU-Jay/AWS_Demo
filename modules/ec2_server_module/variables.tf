variable "ami_name" {
  description = "Name of AMI"
  type        = string
  default     = "ami-03f65b8614a860c29"
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "ec2-nginx"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "vpc_id" {
  type = string
  description = "VPC ID"
}

variable "subnet_id" {}

variable "my_public_ip" {
  description = "public ip cidr"
  type        = string
  default = "0.0.0.0/0"
}