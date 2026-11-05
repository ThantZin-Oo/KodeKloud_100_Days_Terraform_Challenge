resource "aws_s3_bucket" "s3_ran_bucket" {
  bucket = "nautilus-s3-112700141"
  tags = {
    Name = "nautilus-s3-112700141"
  }
}

resource "aws_s3_bucket_acl" "s3_ran_bucket_acl" {
  bucket = aws_s3_bucket.s3_ran_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "enable_versioning" {
  bucket = aws_s3_bucket.s3_ran_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}