variable "cidr_block" {
  default = "10.0.0.0/16"
}
variable "project" {
  type = string
}
variable "environment" {
    type = string
  
}
variable "public_cidr_block" {
    type = list(string)
    
  
}
variable "private_cidr_block" {
    type = list(string)
    
  
}
variable "database_cidr_block" {
    type = list(string)
}
variable "vpc_tags" {
  type = map(string)
  default = {
  }
}
variable "IGW_tags" {
  type = map(string)
  default = {
  }
}
variable "public_tags" {
  type = map(string)
  default = {
  }
}
variable "private_tags" {
  type = map(string)
  default = {
  }
}
variable "eip_tags" {
  type = map(string)
  default = {
  }
}
variable "nat_tags" {
  type = map(string)
  default = {
  }
}
variable "public_route_table_tags" {
    type = map(string)
    default = {}
}

variable "private_route_table_tags" {
    type = map(string)
    default = {}
}

variable "database_route_table_tags" {
    type = map(string)
    default = {}
}
variable "isPeeringRequired" {
  default = false
}