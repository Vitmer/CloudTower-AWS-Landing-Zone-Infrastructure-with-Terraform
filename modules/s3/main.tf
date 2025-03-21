resource "aws_s3_bucket" "bucket" {
  bucket = "my-s3-bucket-vitmer-2025"
}

output "bucket_name" {
  value = aws_s3_bucket.bucket.id
}