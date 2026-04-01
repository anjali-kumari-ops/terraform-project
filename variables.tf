variable "cidr" {
  description = "CIDR block"
  default     = "10.0.0.0/16"
}

variable "environment" {
  description = "Environment name (dev/staging/prod)"
}
