
variable "role_name" {
    type = string
    description = "Role name"
}

variable "tag_value" {
    type = string
    description = "Tag value"
}

resource "aws_iam_role" "test_role" {
  name = var.role_name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = var.tag_value
  }
}
