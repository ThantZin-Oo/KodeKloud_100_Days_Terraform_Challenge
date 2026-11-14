resource "aws_secretsmanager_secret" "kk_secret" {
  name = "devops-secret-t3q3"
}

resource "aws_secretsmanager_secret_version" "kk_secret_key" {
  secret_id = aws_secretsmanager_secret.kk_secret.id
  secret_string = jsonencode({
    username : "admin",
    password : "Namin123"
  })
}