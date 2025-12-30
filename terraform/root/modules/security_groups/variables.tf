
variable "vpc_id" {
  type        = string
  description = "VPC ID where SGs will be created"
}

variable "ssh_cidr" {
  type        = string
  description = "CIDR allowed to SSH (prefer YOUR_IP/32)"
}

variable "tags" {
  type        = map(string)
  description = "Common tags"
}
