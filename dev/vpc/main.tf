#Configure AWS provider
provider "aws"{
    region  = var.region
    profile = "Dev"
}

#create VPC
module "vpc" {
    source                           = "../../modules/vpc"
    region                           = var.region
    project_name                     = var.project_name
    vpc_cidr                         = var.vpc_cidr
    public_subnet_az1_cidr           = var.public_subnet_az1_cidr
    public_subnet_az2_cidr           = var.public_subnet_az2_cidr
    public_subnet_az3_cidr           = var.public_subnet_az3_cidr
    private_subnet_az1_cidr          = var.private_subnet_az1_cidr
    private_subnet_az2_cidr          = var.private_subnet_az2_cidr
    private_subnet_az3_cidr          = var.private_subnet_az3_cidr
    rds_public_subnet_az1_cidr       = var.rds_public_subnet_az1_cidr 
    rds_public_subnet_az2_cidr       = var.rds_public_subnet_az2_cidr 
    rds_public_subnet_az3_cidr       = var.rds_public_subnet_az3_cidr 
    rds_private_subnet_az1_cidr      = var.rds_private_subnet_az1_cidr
    rds_private_subnet_az2_cidr      = var.rds_private_subnet_az2_cidr
    rds_private_subnet_az3_cidr      = var.rds_private_subnet_az3_cidr
}

#create nat Gateway
module "nat_gateway" {
    source                               =  "../../modules/natGateway"
    project_name                         = module.vpc.project_name
    public_subnet_az1_id                 = module.vpc.public_subnet_az1_id
    public_subnet_az2_id                 = module.vpc.public_subnet_az2_id
    public_subnet_az3_id                 = module.vpc.public_subnet_az3_id
    internet_gateway                     = module.vpc.internet_gateway
    vpc_id                               = module.vpc.vpc_id
    private_subnet_az1_id                = module.vpc.private_subnet_az1_id
    private_subnet_az2_id                = module.vpc.private_subnet_az2_id
    private_subnet_az3_id                = module.vpc.private_subnet_az3_id
    rds_public_subnet_az1_id             = module.vpc.rds_public_subnet_az1_id 
    rds_public_subnet_az2_id             = module.vpc.rds_public_subnet_az2_id 
    rds_public_subnet_az3_id             = module.vpc.rds_public_subnet_az3_id 
    rds_private_subnet_az1_id            = module.vpc.rds_private_subnet_az1_id  
    rds_private_subnet_az2_id            = module.vpc.rds_private_subnet_az2_id  
    rds_private_subnet_az3_id            = module.vpc.rds_private_subnet_az3_id
}


#create security group
module "securityGroup" {
    source       = "../../modules/securityGroup"
    vpc_id       =  module.vpc.vpc_id
    project_name =  module.vpc.project_name
}