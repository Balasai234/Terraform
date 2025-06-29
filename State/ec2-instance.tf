resource "aws_instance" "roboshop" {

    for_each = local.ami_map
    ami = each.value

  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.allow_alls.id ]
  tags = merge(
    local.common_tags,
    {
        Compoment = each.key
        Name= each.key
    }

  )
}

resource "aws_security_group" "allow_alls" {
    name        = var.sg_name
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

    tags = merge(local.common_tags, var.sg_tags)
    
}