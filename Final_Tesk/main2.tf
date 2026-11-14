# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  subnet_id     = "subnet-d3a126e7c7e2c1b6e"
  vpc_security_group_ids = [
    "sg-c90d386f6bd3735a7"
  ]

  tags = {
    Name = "devops-ec2-t1q3"
  }
}

# Provision Elastic IP
resource "aws_eip" "ec2_eip" {
  tags = {
    Name = "devops-ec2-eip-t1q3"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2.id
  allocation_id = aws_eip.ec2_eip.id
}