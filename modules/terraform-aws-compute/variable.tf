variable "instance_type" {
  description = "The type of instance to use"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in"
  type        = string
}
