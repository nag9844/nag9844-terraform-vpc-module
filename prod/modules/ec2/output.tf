output "region" {
  value   = var.region
}

output "project_name" {
  value = var.project_name
}

output "aws_instance_id" {
  value       = aws_instance.ec2_instance[0].id
}