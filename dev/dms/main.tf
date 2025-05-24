#Configure AWS provider
provider "aws"{
    region  = var.region
    profile = "UAT"
}


module "dms" {
  count  = var.enable_dms_replica ? 1 : 0
  source = "../../modules/dms"

  depends_on = [aws_db_instance.master, random_string.database_pass]

  dms_instance_name = var.override_db_master_name != "" ? var.override_db_master_name : "${local.basename}"
  migration_type = var.migration_type
  multi_az       = var.multi_az
  table_mappings_string = var.table_mappings_string

  name                                 = var.name
  source_address                       = var.source_address
  source_subnet_ids                    = var.source_subnet_ids
  source_vpc_security_group_ids        = var.source_vpc_security_group_ids
  source_database_name                 = var.source_database_name
  source_engine                        = var.source_engine
  source_password                      = var.source_password
  source_username                      = var.source_username
  source_port                          = var.source_port
  source_instance_subnet_group_name    = var.source_instance_subnet_group_name
  dms_replication_instance_kms_key_arn = var.dms_replication_instance_kms_key_arn

  target_engine                        = var.target_engine
  target_db_multi_az                   = var.target_db_multi_az
  target_allocated_storage             = var.target_allocated_storage
  target_address                       = var.target_address 
  target_database_name                 = var.target_database_name
  target_instance_type                 = var.target_instance_type
  tartget_port                         = var.target_port
  target_instance_engine_version       = var.target_instance_engine_version
  target_instance_parameter_group_name = var.target_instance_parameter_group_name
  target_replica_count                 = var.target_replica_count
  target_storage_encrypted             = var.target_storage_encrypted
  target_instance_kms_key_id           = var.target_instance_kms_key_id
}



