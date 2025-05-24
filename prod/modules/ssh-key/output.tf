output "ssh_key_name" {
  description = "key name of the ssh key"
  value       = aws_key_pair.kubekey.key_name
}