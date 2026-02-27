variable "cluster_name" {
  type = string
}

variable "cluster_endpoint" {
  type = string
}

variable "openid_provider_arn" {
  type = string
}

variable "eks_name" {
  type = string
}

variable "cluster_id" {
  type = string
}

variable "cluster_data_endpoint" {
  type = string
}

variable "cluster_auth_token" {
  type = string
  sensitive = true
}

variable "cluster_certificate_authority" {
  type = string
}

variable "vpc_id" {
  type = string
}

