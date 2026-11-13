resource "aws_vpc" "nautilus-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = var.KKE_vpc
    }
}
resource "aws_security_group" "nautilus-sg" {
    name = var.KKE_sg
    vpc_id = aws_vpc.nautilus-vpc.id
    depends_on = [aws_vpc.nautilus-vpc]
    tags = {
        Name = var.KKE_sg
    }
}

data "aws_security_group" "sg-name" {
    name = aws_security_group.nautilus-sg.name
}

output "sg-name"{
    value = data.aws_security_group.sg-name
}