aws_region            = "us-east-1"
project_name          = "corpapp"
vpc_cidr              = "10.3.0.0/16"
public_subnets        = { "us-east-1a" = "10.3.1.0/24", "us-east-1b" = "10.3.2.0/24", "us-east-1c" = "10.3.3.0/24" }
private_subnets       = { "us-east-1a" = "10.3.10.0/24", "us-east-1b" = "10.3.11.0/24", "us-east-1c" = "10.3.12.0/24" }
eks_node_desired_size = 5
db_instance_class     = "db.r6g.large"
