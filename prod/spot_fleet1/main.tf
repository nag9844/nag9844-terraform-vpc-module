#Configure AWS provider
provider "aws"{
    region  = var.region
    profile = "UAT"
}

module "spot_fleet" {
    source                  = "../../modules/spot_fleet1"
    vpc_id                  = var.vpc_id
    project_name            = var.project_name
    instance_ami            = var.instance_ami
    instance_type           = var.instance_type
    key_name                = var.key_name
    iam_fleet_role          = var.iam_fleet_role
    spot_price              = var.spot_price
    target_capacity         = var.target_capacity
    wait_for_fulfillment    = var.wait_for_fulfillment
    # volume_size             = var.volume_size
    # volume_type             = var.volume_type
    # encrypted               = var.encrypted
    # delete_on_termination   = var.delete_on_termination
}
