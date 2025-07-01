locals {
  common_tags ={
    project = var.project
    environment = var.environment
    terraform = true
  }
az_names = slice(data.aws_availability_zones.az_info.names,0,2)
  }
