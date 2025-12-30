
variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1" # change if needed
}

variable "project" {
  description = "Project name/prefix for tagging"
  type        = string
  default     = "deepak-devops"
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default = {
    Project = "deepak-devops"
    Owner   = "Deepak Pilli"
    Env     = "dev"
  }
}

# Networking
variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  type        = string
  default     = "10.10.1.0/24"
}

variable "availability_zone" {
  description = "AZ for public subnet"
  type        = string
  default     = "ap-south-1a"
}

# Security
variable "ssh_ingress_cidr" {
  description = "CIDR allowed to SSH (prefer YOUR_PUBLIC_IP/32)"
  type        = string
  default     = "0.0.0.0/0" # for dev; restrict in prod
}

# EC2 access
variable "key_name" {
  description = "Existing EC2 key pair name"
  type        = string
}
