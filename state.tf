terraform {
  backend "s3" {
    bucket = "test-s3-state"
    key    = "./terraform.tfstate"
    region = "us-west-2"
  }
}