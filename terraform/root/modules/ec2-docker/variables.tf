
variable "subnet_id" {
  type        = string
  description = "Subnet ID to launch the instance"
}

variable "ids" {
  type        = list(string)
  description = "Security group IDs to attach"
}

variable "key_name" {
  type        = string
  description = "Existing AWS EC2 key pair name"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.medium"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the instance"
}
