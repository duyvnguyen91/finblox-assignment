variable "region" {
  default="ap-southeast-1"
}

variable "environment" {
  description = "The Deployment environment"
}

variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}

variable "public_subnets_cidr" {
  type        = list
  description = "The CIDR block for the public subnet"
}

variable "private_subnets_cidr" {
  type        = list
  description = "The CIDR block for the private subnet"
}

variable "rds_account" {
  description = "RDS account"
}

variable "rds_password" {
  description = "RDS password"
}