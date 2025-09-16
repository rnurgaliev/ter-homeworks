locals {
  platform_instance_name = "${var.vpc_name}-${var.cloud_id}"
  platform_db_instance_name = "${var.vpc_name}-${var.cloud_id}-db"
}