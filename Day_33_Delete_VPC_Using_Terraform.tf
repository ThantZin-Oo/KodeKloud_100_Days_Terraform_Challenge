resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "devops-vpc"
  }
}

#Run "terraform destroy --target=aws_vpc.this"
#Run "terraform state list" to track which resource is exit