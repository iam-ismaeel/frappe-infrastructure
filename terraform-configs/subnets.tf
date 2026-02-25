resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.erpnext.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}