resource "aws_secretsmanager_secret" "xfusion-secret" {
  name = "xfusion-secret"
  tags = {
    Name        = "xfusion-secret"
    Environment = "dev"
  }
}

resource "aws_secretsmanager_secret_version" "xfusion-secret-value" {
  secret_id = aws_secretsmanager_secret.xfusion-secret.id
  secret_string = jsonencode({
    username = "admin",
    password = "Namin123"
  })
}