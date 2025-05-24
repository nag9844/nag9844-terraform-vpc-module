#Configure AWS provider
provider "aws"{
    region  = var.region
    profile = "UAT"
}


module "spot_fleet" {
    source                                = "../../modules/spot_fleet2"
    iam_fleet_role                        = var.iam_fleet_role
    spot_price                            = var.spot_price
    target_capacity                       = var.target_capacity
    # allocation_strategy                 = var.allocation_strategy
    # fleet_type                          = var.fleet_type
    wait_for_fulfillment                  = var.wait_for_fulfillment
    # terminate_instances_with_expiration = var.terminate_instances_with_expiration
    instance_type                         = var.instance_type
    instance_ami                          = var.instance_ami
    key_name                              = var.key_name
    project_name                          = var.project_name
    subnet_id1                            = var.subnet_id1
    subnet_id2                            = var.subnet_id2
    volume_size                           = var.volume_size
    volume_type                           = var.volume_type
    encrypted                             = var.encrypted
    delete_on_termination                 = var.delete_on_termination
}