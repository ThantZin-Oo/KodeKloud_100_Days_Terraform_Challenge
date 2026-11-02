# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.nano"
  subnet_id     = ""
  vpc_security_group_ids = [
    "sg-f20104b3d91e6d236"
  ]

  tags = {
    Name = "devops-ec2"
  }
}

output "instance-state" {
  value = aws_instance.ec2.instance_state
} 