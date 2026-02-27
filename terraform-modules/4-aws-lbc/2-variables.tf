variable "env"  {
    description = "Environment name."
    type        = string
}

variable "eks_name" {
    description = "Name of the cluster."
    type        = string
}

variable "enable_cluster_autoscaler" {
    description = "Name of the cluster"
    type        = bool
    default     = true
}

variable "cluster_autoscaler_helm_version" {
    description  = "cluster Autoscaler Helm version"
    type         = string
}

variable "openid_provider_arn" {
    description = "IAM Openid Connect Provider ARN"
    type        = string
}

variable "cluster_name" {
  type = string
}

variable "cluster_endpoint" {
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

