#Configure AWS provider
provider "aws"{
    region  = var.region
    profile = "UAT"
}


# launch the ec2 instance
module "ec2" {
  source                                          = "../../modules/ec2"
  region                                          = var.region
  instance_ami                                    = var.instance_ami
  ec2_count                                       = var.ec2_count
  project_name                                    = var.project_name
  instance_type                                   = var.instance_type
  vpc_id                                          = var.vpc_id
  key_name                                        = var.key_name
  subnet_id                                       = var.subnet_id
  vpc_security_group_ids                          = var.vpc_security_group_ids
  associate_public_ip_address                     = var.associate_public_ip_address
  encrypted                                       = var.encrypted
  volume_type                                     = var.volume_type
  volume_size                                     = var.volume_size
  delete_on_termination                           = var.delete_on_termination
  vpc                                             = var.vpc
}


module "eip" {
  source          = "../../modules/eip"
  project_name    = module.ec2.project_name
  aws_instance_id = module.ec2.aws_instance_id
  vpc             = var.vpc
}