
variable "vpc_cidr" {
  type        = string
  description = "CIDR for VPC"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR for public subnet"
}

variable "availability_zone" {
  type        = string
  description = "AZ for public subnet"
}

variable "tags" {
  type        = map(string)
  description = "Common tags"
}
