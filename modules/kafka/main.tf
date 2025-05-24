resource "aws_msk_cluster" "msk_cluster" {
  cluster_name           = "${var.env}-${var.microservice_name}"
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes
  enhanced_monitoring    = var.kafka_enhanced_monitoring

  broker_node_group_info {
    instance_type  = var.broker_instance_type
    client_subnets = var.kafka_client_subnets
    storage_info {
      ebs_storage_info {
        volume_size = var.broker_ebs_volume_size
      }
    }

    connectivity_info {
      public_access {
        type = var.public_access
      }
    }
    security_groups = [var.security_group_id]
  }

  client_authentication {
    sasl {
      iam = true
    }
  }

  encryption_info {

  }

  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled   = true
        log_group = aws_cloudwatch_log_group.CloudWatchLogGroup.name
      }
    }
  }

  tags = {
    Environment = var.env
    Team        = var.team
  }
}

resource "aws_cloudwatch_log_group" "CloudWatchLogGroup" {
  name              = "${var.env}-${var.microservice_name}-kafka-logs"
  retention_in_days = var.kafka_logs_retention_period

  tags = {
    Environment = var.env
    Team        = var.team
  }
}
