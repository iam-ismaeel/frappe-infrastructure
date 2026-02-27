output "eks_cluster_name" {
  value = aws_eks_cluster.this.name
}

output "openid_provider_arn" {
  value = aws_iam_openid_connect_provider.this[0].arn
}

output "eks_cluster_id" {
  value = aws_eks_cluster.this.id
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "eks_cluster_auth_token" {
  value = data.aws_eks_cluster_auth.this.token
  sensitive = true
}

output "eks_cluster_data_endpoint" {
  value = data.aws_eks_cluster.this.endpoint
}

output "eks_cluster_certificate_authority" {
  value = data.aws_eks_cluster.this.certificate_authority[0].data
}