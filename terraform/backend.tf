terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "duynv-tf-state"
    dynamodb_table = "duynv-tf-state-lock"
    region         = "ap-southeast-1"
    key            = "terraform.tfstate"
  }
}