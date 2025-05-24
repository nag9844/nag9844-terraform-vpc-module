#Configure AWS provider
provider "aws"{
    region  = var.region
    profile = "UAT"
}

module "spot_ec2" {
    source = "../../modules/spot_ec2"
    instance_ami                    = var.instance_ami
    spot_price                      = var.spot_price
    instance_type                   = var.instance_type
    subnet_id                       = var.subnet_id
    spot_type                       = var.spot_type
    vpc_security_group_ids          = var.vpc_security_group_ids
    wait_for_fulfillment            = var.wait_for_fulfillment
    key_name                        = var.key_name
    associate_public_ip_address     = var.associate_public_ip_address
    encrypted                       = var.encrypted
    volume_type                     = var.volume_type
    volume_size                     = var.volume_size
    delete_on_termination           = var.delete_on_termination
    project_name                    = var.project_name
}