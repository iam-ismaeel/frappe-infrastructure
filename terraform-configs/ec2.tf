resource "aws_instance" "erpnext" {
  ami           = "ami-xxxxxxxx" # Ubuntu 22
  instance_type = "t3.large"
  key_name      = "erpnext-key"

  vpc_security_group_ids = [aws_security_group.erpnext_sg.id]

  tags = {
    Name = "erpnext-prod"
  }
}