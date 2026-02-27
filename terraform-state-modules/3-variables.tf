variable "s3_bucket_name" {
  description = "S3 backend for state storage"
  type = list(string)
}
variable "dynamodb_name" {
  description = "State management"
  type = list(string)
}

