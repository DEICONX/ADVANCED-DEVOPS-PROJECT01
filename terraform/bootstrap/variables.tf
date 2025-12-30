
variable "region" {
  description = "AWS region for S3 and DynamoDB"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "S3 bucket name for Terraform remote state (must be globally unique)"
  type        = string
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name for Terraform state locking"
  type        = string
  default     = "terraform-state-locks"
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {
    Project = "deepak-devops"
    Owner   = "Deepak Pilli"
  }
}
