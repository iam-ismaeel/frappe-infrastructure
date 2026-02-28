#create an elastic ip for the purpose of our NAT gateway
resource "aws_eip" "this" {
  count = 2
  domain = "vpc"

  tags = {
       Name = "${var.env} eip-${count.index}"
  }
}

#NAT-Gateway
resource "aws_nat_gateway" "this" {
  count = var.nat_gateway_count
  allocation_id = aws_eip.this[count.index].id
  subnet_id = var.az_public_subnet[count.index]

  tags = {
    Name = "${var.env}-nat"
  }
  depends_on = [aws_internet_gateway.this]
}
