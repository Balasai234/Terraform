variable "security_group_ids" {
    default = ["sg-0ccba06af95f41fdb"]
}
variable "instance_type" {
    default = "t3.large"
  
}
variable "tags" {
 default= {
    Name ="Roboshop-cart"
    Terraform ="true"
    Environment="dev"
}
}