resource "aws_dms_endpoint" "source" {
  endpoint_id   = "${var.name}-source"
  endpoint_type = "source"
  engine_name   = var.source_engine
  server_name   = var.source_address
  port          = var.source_port
  database_name = var.source_database_name
  username      = var.source_username
  password      = var.source_password
}

resource "aws_dms_endpoint" "target" {
  endpoint_id   = "${var.name}-target"
  endpoint_type = "target"
  engine_name   = var.target_engine
  server_name   = var.target_address
  port          = var.tartget_port
  database_name = var.target_database_name
  username      = var.username
  password      = var.password
}

resource "aws_dms_replication_instance" "service" {
  replication_instance_id     = "${var.name}-replication-instance"
  replication_subnet_group_id = aws_dms_replication_subnet_group.service.id
  kms_key_arn                 = var.kms_key_arn
  publicly_accessible         = var.public_accessible
  vpc_security_group_ids      = var.source_vpc_security_group_ids
  replication_instance_class  = var.instance_class
  allocated_storage           = var.target_allocated_storage
  apply_immediately           = var.apply_immediately
  multi_az                    = var.multi_az
  depends_on = [
    aws_iam_role_policy_attachment.dms_access_for_endpoint_amazon_dms_redshift_s3_role,
    aws_iam_role_policy_attachment.dms_cloudwatch_logs_role_amazon_dms_cloud_watch_logs_role,
    aws_iam_role_policy_attachment.dms_vpc_role_amazon_dmsvpc_management_role
  ]
}

resource "aws_dms_replication_subnet_group" "service" {
  replication_subnet_group_description = "${var.name}-dms-replication-subnet-group"
  replication_subnet_group_id          = "${var.name}-dms-replication-subnet-group"
  subnet_ids                           = var.subnet_ids
}

resource "aws_dms_replication_task" "service" {
  migration_type           = var.migration_type
  replication_instance_arn = aws_dms_replication_instance.service.replication_instance_arn
  replication_task_id      = "${var.name}-dms-replication-task"
  table_mappings           = var.table_mappings_string
  source_endpoint_arn      = aws_dms_endpoint.source.endpoint_arn
  target_endpoint_arn      = aws_dms_endpoint.target.endpoint_arn
}