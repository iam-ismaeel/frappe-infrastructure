# Route Table [Route public subnets to the igw]
resource "aws_route_table" "public_subnet_route_table" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.env}-public-subnet-route-table"
  }
}

# Public subnets route table association
resource "aws_route_table_association" "public_subnet_route_table_association" {
  count = length(var.az_public_subnet)
  subnet_id      = aws_subnet.az_public_subnet[count.index].id
  route_table_id = aws_route_table.public_subnet_route_table.id
}

# Route Table [Route private subnets to the natgw]
resource "aws_route_table" "private_subnet_route_table" {
  vpc_id = aws_vpc.this.id
  count  = length(var.availability_zones)

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this[count.index].id
  }

  tags = {
    Name = "${var.env}-private-subnet-route-table-${count.index}"
  }
}
# Private subnets route table association
resource "aws_route_table_association" "private_subnet_route_table_association" {
  count = length(var.az_private_subnet)
  subnet_id      = aws_subnet.az_private_subnet[count.index].id
  route_table_id = aws_route_table.private_subnet_route_table[count.index].id
}




