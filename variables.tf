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

variable "my_public_ip" {
  description = "public ip cidr"
  type        = string
}