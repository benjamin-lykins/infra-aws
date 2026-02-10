variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "default_tags" {
  description = "A map of default tags to apply to all resources"
  type        = map(string)
  default     = {}

}

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

### Load Balancer ###

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

variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
}


### Compute ###

variable "compute_create" {
  description = "Whether to create a compute instance"
  type        = bool
  default     = true
}

variable "compute_subnet_id" {
  description = "The ID of the subnet to launch the compute instance in"
  type        = string

}

variable "compute_instance_type" {
  description = "The instance type for the compute instance"
  type        = string
  default     = "t2.micro"
}

### S3 Bucket ###

variable "s3_create" {
  description = "Whether to create an S3 bucket"
  type        = bool
  default     = false
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}
