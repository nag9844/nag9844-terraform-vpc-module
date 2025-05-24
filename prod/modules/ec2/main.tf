# launch the ec2 instance
resource "aws_instance" "ec2_instance" {
  ami                             = var.instance_ami
  count                           = var.ec2_count
  instance_type                   = var.instance_type
  associate_public_ip_address     = var.associate_public_ip_address
  subnet_id                       = var.subnet_id
  key_name                        = var.key_name
  vpc_security_group_ids          = [var.vpc_security_group_ids]

  root_block_device {
    encrypted             = var.encrypted
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    delete_on_termination = var.delete_on_termination
    tags = {
    Name =  "${var.project_name}-vol"
    } 
  }
  tags = {
    Name = var.project_name
  }
}