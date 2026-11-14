resource "aws_s3_bucket" "devops_s3" {
  bucket = "devops-s3-825378115-t4q2"
}

resource "aws_s3_bucket_ownership_controls" "devops_s3" {
  bucket = aws_s3_bucket.devops_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "devops_s3" {
  bucket = aws_s3_bucket.devops_s3.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.devops_s3,
    aws_s3_bucket_public_access_block.devops_s3,
  ]

  bucket = aws_s3_bucket.devops_s3.id
  acl    = "public-read"
}
