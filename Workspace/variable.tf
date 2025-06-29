variable "ami_id" {
    type = string
  default ="ami-09c813fb71547fc4f"
  description = "AMI"
}
variable "instance_type" {
  default = {
    dev = "t3.micro"
    prod ="t3.small"
  }
}

variable "sg_name"{
    default=" var-flies-allow_alls"
}
variable "sg_description"{
    default="allow all traffic"
}
variable "from_port"{
    type= number
    default = 0
}
variable "to_port"{
    type= number
    default = 0
}
variable "cidr_blocks"{

    type = list(string)
    default = ["0.0.0.0/0"]
}
variable "sg_tags" {
    default = "allow_alls"

}
variable "instances" {
    default = ["SQL","Node.js","Nginx","Roboshop"]
  
}
variable "zone_id" {
  default = "Z032558618100M4EJX8X4"
}
variable "domain_name" {
  default = "daws84s.site"
}
variable "project" {
 default = "Roboshop"
  
}
variable "common_tags"{
    default = {
        Project = "roboshop"
        Terraform = "true"
    }
}