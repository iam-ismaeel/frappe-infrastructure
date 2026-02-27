resource "aws_iam_role" "terraform" {
  name = "terraform-state-role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = "arn:aws:iam::046651569857:user/ismail"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "terraform_policy" {
  name        = "terraform-state-policy"
  description = "Policy for Terraform to manage S3 and DynamoDB"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:ListBucket", "s3:GetObject", "s3:PutObject", "s3:DeleteObject", "s3:GetBucketVersioning","s3:GetEncryptionConfiguration","s3:GetBucketAcl","s3:GetBucketPolicy","s3:PutBucketPolicy","s3:PutBucketVersioning","s3:GetBucketPublicAccessBlock","s3:PutEncryptionConfiguration"]
        Resource = ["arn:aws:s3:::frappe-terraform-state", "arn:aws:s3:::frappe-terraform-state/*"]
      },
      {
        Effect   = "Allow"
        Action   = ["dynamodb:PutItem", "dynamodb:GetItem", "dynamodb:DeleteItem", "dynamodb:UpdateItem","dynamodb:DescribeTable"]
        Resource = "arn:aws:dynamodb:us-east-1:046651569857:table/frappe-terraform-lock-table"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "terraform_attach" {
  role       = aws_iam_role.terraform.name
  policy_arn = aws_iam_policy.terraform_policy.arn
}
