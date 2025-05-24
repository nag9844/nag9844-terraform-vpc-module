variable "region" {}
variable "name" {}
variable "source_address" {}
variable "source_subnet_ids" {}
variable "source_vpc_security_group_ids" {}
variable "source_database_name" {}
variable "source_engine" {}
variable "source_password" {}
variable "source_username" {}
variable "source_port" {}
variable "source_instance_subnet_group_name" {}
variable "dms_replication_instance_kms_key_arn" {}


variable "target_engine" {}
variable "target_db_multi_az" {}
variable "target_allocated_storage" {}
variable "target_instance_name" {}
variable "target_instance_type" {}
variable "target_instance_engine_version" {}
variable "target_instance_parameter_group_name" {}
variable "target_replica_count" {}
variable "target_storage_encrypted" {}
variable "target_instance_kms_key_id" {}