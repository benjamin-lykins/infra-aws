output "vpc_id" {
  description = "The ID of the VPC"
  value       = var.vpc_create ? one(module.vpc.*.vpc_id) : ""
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = var.vpc_create ? one(module.vpc.*.public_subnet_ids) : []
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = var.vpc_create ? one(module.vpc.*.private_subnet_ids) : []
}
