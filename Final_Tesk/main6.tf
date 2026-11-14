resource "aws_dynamodb_table" "devops-users-t3q1" {
  name         = "devops-users-t3q1"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "devops_id_t3q1"

  attribute {
    name = "devops_id_t3q1"
    type = "S"
  }
}