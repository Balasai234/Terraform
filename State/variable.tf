variable "services" {
    type = list(string)
    default= ["Nginx","MongoDb","Backend"]
}
variable "environment" {
    type = string
    default = "dev"
  
}
variable "Project" {
   default = "Roboshop"

}
variable "compoments" {
    default = ["Nginx","MongoDb","Backend"]
  
}
variable "sg_name"{
    default="allow_alls"
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
    default = {
        Name = "allow-alls"
    }
}
variable "instance_type" {
  default = "t3.micro"
}