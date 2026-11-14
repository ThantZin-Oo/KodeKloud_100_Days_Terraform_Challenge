resource "aws_s3_bucket" "devops_s3" {
  bucket = "devops-s3-825378115-t4q1t"
}

resource "aws_s3_bucket_ownership_controls" "devops_s3" {
  bucket = aws_s3_bucket.devops_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "devops_s3" {
  depends_on = [aws_s3_bucket_ownership_controls.devops_s3]

  bucket = aws_s3_bucket.devops_s3.id
  acl    = "private"
}
