variable "compute_create" {
  description = "Whether to create a compute instance"
  type        = bool
  default     = true
}

variable "compute_instance_type" {
  description = "The instance type for the compute instance"
  type        = string
  default     = "t2.micro"
}

module "compute" {
  count   = var.compute_create ? 1 : 0
  source  = "app.terraform.io/lykins/compute/aws"
  version = "1.0.0"

  instance_type = var.compute_instance_type
}

variable "s3_create" {
  description = "Whether to create an S3 bucket"
  type        = bool
  default     = false
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

module "s3" {
  count   = var.s3_create ? 1 : 0
  source  = "app.terraform.io/lykins/s3/aws"
  version = "1.0.0"

  bucket_name = var.s3_bucket_name
}

variable "lb_create" {
  description = "Whether to create a load balancer"
  type        = bool
  default     = true
}

variable "lb_create" {
  description = "Whether to create a load balancer"
  type        = bool
  default     = true
}

variable "lb_internal" {
  description = "Whether the load balancer is internal"
  type        = bool
  default     = true
}

variable "lb_security_groups" {
  description = "A list of security group IDs to associate with the load balancer"
  type        = list(string)
  default     = []
}

variable "lb_subnets_ids" {
  description = "A list of subnet IDs to associate with the load balancer"
  type        = list(string)
  default     = []
}

variable "lb_type" {
  description = "The type of the load balancer"
  type        = string
  default     = "application"
}

module "lb" {
  source  = "app.terraform.io/lykins/lb/aws"
  version = "1.0.0"

}

module "target_group" {
  source  = "app.terraform.io/lykins/target-group/aws"
  version = "1.0.0"

}
