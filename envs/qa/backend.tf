terraform {
  backend "s3" {
    bucket         = "qa-state-bucket"
    key            = "qa-infra/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}