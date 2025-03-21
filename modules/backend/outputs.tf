output "s3_bucket_name" {
  description = "S3 bucket name for Terraform state"
  value       = var.s3_bucket_name
}

output "dynamodb_table_name" {
  description = "DynamoDB table name for Terraform state locking"
  value       = var.dynamodb_table_name
}