resource "aws_default_vpc" "main" {
    tags = {
        Name = var.vpc_name
  }
}

data "aws_availability_zones" "available_zones" {}

resource "aws_default_subnet" "default_az1" {
  availability_zone = data.aws_availability_zones.available_zones.names[0]
}