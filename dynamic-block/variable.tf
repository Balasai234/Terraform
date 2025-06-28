variable "ami_id" {
    type = string
  default ="ami-09c813fb71547fc4f"
  description = "AMI"
}
variable "instance_type" {
  default = "t3.micro"
}
variable "tags" {
  type = map(string) 
 default= {
    name = "Hello-world"
    Purpose = "variable_demo"
  }
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
variable "ingress_port" {
    default = [                         #(list(map))
        {
            from_port = 22
            to_port =22

        },
        {from_port = 80
         to_port = 80

        },
        {
            from_port = 443
            to_port =443
        }
           

    ]
  
}