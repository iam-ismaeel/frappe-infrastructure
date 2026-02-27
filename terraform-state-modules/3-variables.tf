variable "s3_bucket_name" {
  description = "S3 backend for state storage"
  type = string
}
variable "dynamodb_name" {
  description = "State management"
  type = string
}

variable "region" {
    description = "aws region"
    type   =  string
}