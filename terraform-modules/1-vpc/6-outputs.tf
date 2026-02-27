output "vpc_id" {
    value = aws_vpc.this.id
}

output "private_subnet_ids" {
    description = "List of IDs of private subnets"
    value       = aws_subnet.az_private_subnet[*].id
}

output "public_subnet_ids" {
    description = "List of IDs of public subnets"
    value       = aws_subnet.az_public_subnet[*].id
    
}