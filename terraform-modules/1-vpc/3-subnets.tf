resource "aws_subnet" "az_private_subnet" {
  count = length(var.az_private_subnet)

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.az_private_subnet[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    {Name = "${var.env}-private-subnet-${var.availability_zones[count.index]}" },
    var.private_subnet_tags
  ) 
}

resource "aws_subnet" "az_public_subnet" {
  count = length(var.az_public_subnet)

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.az_public_subnet[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    {Name = "${var.env}-public-subnet-${var.availability_zones[count.index]}" },
    var.public_subnet_tags
  ) 
}