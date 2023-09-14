variable "my_public_ip" {
  description = "public ip cidr"
  type        = string
  default = "ec2"
}

variable "instance_name" {
  default = "0.0.0.0/0"
}