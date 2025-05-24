resource "aws_eip" "demo-eip" {
  instance = var.aws_instance_id
  vpc      = var.vpc
  
  tags   = {
    Name = "${var.project_name}-eip"
  }
}