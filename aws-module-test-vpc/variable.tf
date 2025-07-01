variable "project" {
    default = "Roboshop"
  
}
variable "environment" {
    default = "dev"
  
}
variable "public_cidr_block" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "private_cidr_block" {
  default = ["10.0.4.0/24", "10.0.6.0/24"]
}
variable "database_cidr_block" {
  default = ["10.0.8.0/24", "10.0.10.0/24"]
}