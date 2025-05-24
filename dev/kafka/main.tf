#Configure AWS provider
provider "aws"{
    region  = var.region
    profile = "UAT"
}


module "kafka" {
  source                      = "../../modules/kafka"
  microservice_name           = var.microservice_name
  env                         = var.env
  team                        = var.team
  kafka_client_subnets        = var.kafka_client_subnets
  broker_ebs_volume_size      = var.broker_ebs_volume_size
  broker_instance_type        = var.broker_instance_type
  kafka_version               = var.kafka_version
  number_of_broker_nodes      = var.number_of_broker_nodes
  kafka_enhanced_monitoring   = var.kafka_enhanced_monitoring
  kafka_logs_retention_period = var.kafka_logs_retention_period
  security_group_id           = var.security_group_id
  public_access               = var.public_access
}