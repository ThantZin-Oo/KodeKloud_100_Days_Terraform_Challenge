resource "aws_s3_bucket" "my_bucket" {
  bucket = "devops-cp-131183028"

  tags = {
    Name = "devops-cp-131183028"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.my_bucket.id
  acl    = "private"
}

resource "aws_s3_object" "upload_file" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "devops.txt"
  source = "/tmp/devops.txt"
  etag   = filemd5("/tmp/devops.txt")
}

data "aws_s3_object" "upload_file_read" {
  bucket = aws_s3_object.upload_file.bucket
  key    = "devops.txt"
}
output "file_etag" {
  value       = aws_s3_object.upload_file.etag
  description = "This value is etag of s3"
}

output "file_content" {
  value = data.aws_s3_object.upload_file_read.body
}