variable "env" {
  description = "environment"
  type        = string
}


variable "vpc_cidr_block" {
    description = "Main VPC CIDR Block"
    type        = string
    default     = "192.168.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones  for subnets"
  type = list(string)
}

variable "az_public_subnet" {
  description = "CIDR ranges for public subnets."
  type = list(string)
}

variable "az_private_subnet" {
  description = "CIDR ranges for private subnets"
  type = list(string)
}

variable "private_subnet_tags" {
  description = "Private subnet tags"
  type        = map(any)
}

variable "public_subnet_tags" {
  description = "Public subnet tags"
  type        = map(any)
}

variable "nat_gateway_count" {
  description = "Nat gateways,which can either be one for an entire region to save cost or one per az."
  type    = number
  default = 1 
}

variable "az_subnets" {
  type    = list(string)
}










