variable "port" {
  description = "The port on which the target is listening"
  type        = number
  default     = 80
}

variable "protocol" {
  description = "The protocol to use for routing traffic to the targets"
  type        = string
  default     = "HTTP"
}

variable "tg_name" {
  description = "The name of the Target Group"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "target_group_attachments" {
  description = "A map of target IDs to attach to the Target Group"
  type        = list(string)
}
