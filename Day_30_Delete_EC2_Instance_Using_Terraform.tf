# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-1054ddc22c4da8bf1"
  ]

  tags = {
    Name = "xfusion-ec2"
  }
}

#Run "terraform destroy --target=aws_instance.ec2"
#Run "terraform state list" to track which resource is exit