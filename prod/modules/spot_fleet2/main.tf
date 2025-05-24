# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}

resource "aws_spot_fleet_request" "spotRequest" {
  iam_fleet_role                      = var.iam_fleet_role
  spot_price                          = var.spot_price
  target_capacity                     = var.target_capacity
  # allocation_strategy                 = var.allocation_strategy
  # fleet_type                          = var.fleet_type
  wait_for_fulfillment                = var.wait_for_fulfillment
  # terminate_instances_with_expiration = var.terminate_instances_with_expiration

  launch_specification {
    instance_type     = var.instance_type
    ami               = var.instance_ami
    key_name          = var.key_name
    subnet_id         = var.subnet_id1
    availability_zone = data.aws_availability_zones.available_zones.names[0]
    root_block_device {
      volume_size           = var.volume_size
      volume_type           = var.volume_type
      encrypted             = var.encrypted
      delete_on_termination = var.delete_on_termination
    }
    tags = {
      Name = var.project_name
    }
  }

  launch_specification {
    instance_type         = var.instance_type
    ami                   = var.instance_ami
    key_name              = var.key_name
    subnet_id             = var.subnet_id2
    availability_zone     = data.aws_availability_zones.available_zones.names[1]
    root_block_device {
      volume_size           = var.volume_size
      volume_type           = var.volume_type
      encrypted             = var.encrypted
      delete_on_termination = var.delete_on_termination
    }
    tags = {
      Name = var.project_name
    }
  }
}
