resource "aws_instance" "roboshop" {
  ami = var.ami_id
  count = length(var.instances)
 
  instance_type = lookup(var.instance_type,terraform.workspace) 
  vpc_security_group_ids = [ aws_security_group.allow_alls.id ]
  tags = merge(
   var.common_tags,
    {
      Name =" ${var.project}-${var.instances[count.index]}-${terraform.workspace}"
      compoments= "${var.instances[count.index]}"
      workspace="${terraform.workspace}"
    }
  )
  
}

resource "aws_security_group" "allow_alls" {
    name        = "${var.project}-${var.sg_name}-${terraform.workspace}"
    description = var.sg_description
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

    tags  = merge(
      var.common_tags,
      {
         Name ="${var.project}-${var.sg_tags}-${terraform.workspace}"
      }
    )
    
}