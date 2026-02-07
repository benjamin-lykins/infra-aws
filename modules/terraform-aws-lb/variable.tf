variable "lb_name" {
  description = "The name of the Load Balancer"
  type        = string

}

variable "lb_internal" {
  description = "Whether the Load Balancer is internal"
  type        = bool
}

variable "lb_type" {
  description = "The type of Load Balancer"
  type        = string
}

variable "lb_security_group_ids" {
  description = "The security group IDs to associate with the Load Balancer"
  type        = list(string)
}

variable "lb_subnet_ids" {
  description = "The subnet IDs to associate with the Load Balancer"
  type        = list(string)
}
