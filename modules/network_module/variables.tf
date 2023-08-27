variable "vpc_name"{
    type = string
    description = "VPC Name"
    default = "Default VPC"
}

variable "vpc_cidr_block" {
    type = string
    description = "CIDR block of the VPC"
    default = "10.0.0.0/16"
}