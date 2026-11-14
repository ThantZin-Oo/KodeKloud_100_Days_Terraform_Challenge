# Create IAM user
resource "aws_iam_user" "user" {
  name = "iamuser_john_t2q3"

  tags = {
    Name = "iamuser_john_t2q3"
  }
}

# Create IAM Policy
resource "aws_iam_policy" "policy" {
  name        = "iampolicy_john_t2q3"
  description = "IAM policy allowing EC2 read actions for john"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["ec2:Read*"]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "user_policy" {
  user       = "iamuser_john_t2q3"
  policy_arn = aws_iam_policy.policy.arn
}