resource "aws_instance" "roboshop" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.allow_alls.id ]
  tags = var.tags
  
}

resource "aws_security_group" "allow_alls" {
    name        = var.sg_name
    description = var.sg_description
  dynamic  ingress {
    for_each = var.ingress_port
    content {
        from_port= ingress.value["from_port"]

        to_port    = ingress.value["to_port"]
        protocol         = "tcp"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
      
    }
        
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