locals {
  ami_map={
    Nginx =data.aws_ami.joindevops.id
    MongoDb=data.aws_ami.joindevops.id
    Backend=data.aws_ami.joindevops.id
  }
    common_tags = {
    Project     = var.Project
    Environment = var.environment
    Owner       = "Sumit"
  }
}
