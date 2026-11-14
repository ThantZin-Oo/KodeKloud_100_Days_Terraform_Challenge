resource "aws_iam_policy" "kk_policy" {
  name        = var.KKE_iampolicy
  description = "KK_police for EC2 describe"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}