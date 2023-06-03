terraform {
  required_version = "0.14.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.1.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  #profile = "tf014"
}

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "my-tf-bucket-treinamento"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby   = "Terraform"
  }
}

resource "aws_s3_bucket_ownership_controls" "my-test-bucket" {
  bucket = aws_s3_bucket.my-test-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "my-test-bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.my-test-bucket]

  bucket = aws_s3_bucket.my-test-bucket.id
  acl    = "private"
}
