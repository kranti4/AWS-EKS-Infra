terraform {
  backend "s3" {
    bucket         = "prod-state-bucket"
    key            = "prod-infra/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}