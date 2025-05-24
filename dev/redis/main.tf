#Configure AWS provider
provider "aws"{
    region  = var.region
    profile = "UAT"
}


module "redis" {
  source = "../../modules/redis"

  cluster_id            = var.cluster_id
  engine_version        = var.engine_version
  instance_type         = var.instance_type
  maintenance_window    = var.maintenance_window
  parameter_group_name  = var.parameter_group_name
  vpc_id                = var.vpc_id
  private_subnet_ids    = var.private_subnet_ids
  tag_name              = var.tag_name
  tag_team              = var.tag_team
  tag_environment       = var.tag_environment
}