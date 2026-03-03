terraform {
  backend "s3" {
    bucket         = "dev-state-bucket"
    key            = "dev-infra/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}