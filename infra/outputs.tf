output "vpc_id" {
  description = "ID of the demo VPC."
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "Public subnet IDs in ap-south-1."
  value       = module.vpc.public_subnets
}
