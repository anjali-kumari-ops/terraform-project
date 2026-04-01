variable "vpc_id" {
  description = "VPC ID for ALB"
  type        = string
}

variable "subnets" {
  description = "Subnets for ALB"
  type        = list(string)
}

variable "alb_sg" {
  description = "Security group for ALB"
  type        = string
}
