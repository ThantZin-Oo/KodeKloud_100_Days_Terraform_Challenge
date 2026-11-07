resource "aws_iam_group" "this" {
  name = "iamgroup_james"
}

#Run "terraform destroy --target=aws_instance.ec2"
#Run "terraform state list" to track which resource is exit