output "aws_subnet" {
    value = aws_default_subnet.default_az1.id
}

output "aws_vpc" {
    value = aws_default_vpc.main.id
}