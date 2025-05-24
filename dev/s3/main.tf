#Configure AWS provider
provider "aws"{
    region  = var.region
    profile = "UAT"
}

module "s3_bucket" {
    source  = "../../modules/s3"
    bucket_name = var.bucket_name
    Environment = var.Environment
}