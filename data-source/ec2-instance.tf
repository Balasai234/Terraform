resource "aws_instance" "roboshop" {
  ami           = "data.aws_ami.joindevops"
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow_alls.id ]
  tags = {
    Name = "datasource-roboshop"
  }
  
}

resource "aws_security_group" "allow_alls" {
    name        = "allow_alls"
    description = "it allows all ports"
  ingress {
    from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      =["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]

  }
        
    
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags  = {
      Name = "allow_alls"
    }
    
}