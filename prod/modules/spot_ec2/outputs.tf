
output "project_name" {
  value = var.project_name
}

output "aws_spot_instance_request_id" {
  value       = aws_spot_instance_request.spotec2.id
}