variable "bucket_name" {
    type = string
    description = "Bucket name"
}

variable "region" {
    type = string
    description = "AWS region"
}


provider "aws" {
    region = var.region
}

resource "aws_s3_bucket" "demos3" {
    bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.demos3.id
  acl    = "private"
}


variable "acl_value" {
    default = "private"
}
