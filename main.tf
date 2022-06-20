provider "aws" {
    region = "eu-west-2"
}

resource "aws_s3_bucket" "demos3" {
    bucket = "yuval-demo-bucket-1" 
}


resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.demos3.id
  acl    = "private"
}


variable "acl_value" {
    default = "private"
}
