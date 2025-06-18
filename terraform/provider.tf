# Cloud Anbieter konfigurieren
provider "aws" {
  region = var.aws_region
}

# Terraform-Backend (S3) einrichten
terraform {
  backend "s3" {
    bucket         = "tf-cloud-programming"
    key            = "amplify/cloud_programming_app/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}
