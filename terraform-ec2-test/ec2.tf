module "EC2" {
 source ="../aws-instance-module"
 sg_ids = var.security_group_ids
 tags = var.tags
 instance_type = var.instance_type
}