resource "aws_eip" "datacenter-eip" {
  domain = "vpc"
  tags = {
    Name = var.KKE_eip
  }
}