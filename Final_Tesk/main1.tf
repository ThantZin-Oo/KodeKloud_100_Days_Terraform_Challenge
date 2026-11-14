# Create the key pair
resource "tls_private_key" "devops-kp-t1q1" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS key pair
resource "aws_key_pair" "devops-kp-t1q1" {
  key_name   = "devops-kp-t1q1"
  public_key = tls_private_key.devops-kp-t1q1.public_key_openssh
}

# Save the private key to file
resource "local_file" "private_key" {
  content         = tls_private_key.devops-kp-t1q1.private_key_pem
  filename        = "/home/bob/devops-kp-t1q1.pem"
  file_permission = "0400"
}

# Output the key pair name (optional)
output "key_pair_name" {
  value = aws_key_pair.devops-kp-t1q1.key_name
}