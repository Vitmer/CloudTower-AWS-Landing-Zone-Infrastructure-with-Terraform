variable "deny_s3_public_json" {
  description = "SCP JSON content for denying S3 public access"
  type        = string
}

variable "ou_id" {
  description = "Organizational Unit ID to attach the SCP"
  type        = string
}

variable "root_id" {
  description = "Root ID for AWS Organizations"
  type        = string
}