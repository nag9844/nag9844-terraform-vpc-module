# Launch template
data "aws_subnets" "sub_ids" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}


resource "aws_launch_template" "spotrequest" {
  name          = var.project_name
  image_id      = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.key_name
  # root_block_device {
  #     volume_size           = var.volume_size
  #     volume_type           = var.volume_type
  #     encrypted             = var.encrypted
  #     delete_on_termination = var.delete_on_termination
  # }
}

resource "aws_spot_fleet_request" "spotrequest" {
  iam_fleet_role        = var.iam_fleet_role
  spot_price            = var.spot_price
  target_capacity       = var.target_capacity
  wait_for_fulfillment  = var.wait_for_fulfillment

  launch_template_config {
    launch_template_specification {
      id      = aws_launch_template.spotrequest.id
      version = aws_launch_template.spotrequest.latest_version
    }
    overrides {
      subnet_id = data.aws_subnets.sub_ids.ids[0]
    }
    overrides {
      subnet_id = data.aws_subnets.sub_ids.ids[1]
    }
    overrides {
      subnet_id = data.aws_subnets.sub_ids.ids[2]
    }
  }

}