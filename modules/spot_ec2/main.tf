#Request Spot instance
resource "aws_spot_instance_request" "spotec2" {
  ami                           = var.instance_ami
  spot_price                    = var.spot_price
  instance_type                 = var.instance_type
  subnet_id                     = var.subnet_id
  spot_type                     = var.spot_type
  vpc_security_group_ids        = [var.vpc_security_group_ids]
  wait_for_fulfillment          = var.wait_for_fulfillment
  key_name                      = var.key_name
  associate_public_ip_address   = var.associate_public_ip_address

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



