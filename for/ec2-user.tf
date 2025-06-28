resource "aws_instance" "roboshop" {
  ami          = var.ami_id
  for_each = var.instances
  /* count = 4 # if you can specific the count attribute that no of instances are created in console */
 # instance_type = var.instance_type calling from the variable.tf files
  instance_type = var.environment == "dev" ? "t3.micro":"t3.small" # Condition caluse syntax: condition ? true:false
  vpc_security_group_ids = [ aws_security_group.allow_alls.id ]
  tags = {
    Name=each.key # In variable tf file we have a 
  } 
  
}

resource "aws_security_group" "allow_alls" {
    name        = var.sg_name # calling from terraform.tfvars file
    description = var.sg_description # calling from tf variable.tf file
    ingress {
        from_port= var.from_port

        to_port    = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }

    tags  = var.sg_tags
    
}