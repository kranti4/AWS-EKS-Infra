variable "aws_region" {
  type        = string
  description = "The AWS region to deploy into"
}

variable "project_name" {
  type        = string
  description = "Base name for resources"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "private_subnets" {
  type        = map(string)
  description = "Map of AZ to CIDR for private subnets"
}

variable "public_subnets" {
  type        = map(string)
  description = "Map of AZ to CIDR for public subnets"
}

variable "eks_node_desired_size" {
  type = number
}

variable "db_instance_class" {
  type = string
}