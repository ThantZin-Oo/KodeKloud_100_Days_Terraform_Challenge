resource "aws_iam_role" "role" {
  name = "iamrole_jim"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "iamrole_jim"
  }
}

#Run "terraform destroy --target=aws_iam_role.role"
#Run "terraform state list" to track which resource is exit