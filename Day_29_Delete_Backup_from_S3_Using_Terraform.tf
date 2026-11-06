# Add your code below
variable "target_bucket_name" {
  type        = string
  description = "The name of the S3 bucket you want to backup and destroy"
  default     = "nautilus-bck-107199781"
}
resource "terraform_data" "download-s3-data" {
  input = var.target_bucket_name
  provisioner "local-exec" {
    command = <<EOT
        aws s3 sync s3://${self.input}/ /opt/s3-backup/ \
        && aws s3 rm s3://${self.input}/ --recursive \
        && aws s3 rb s3://${self.input}/ --force
        EOT
  }
}
