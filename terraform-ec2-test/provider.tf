provider "aws" {
    
  region="us-east-1"
}
terraform {
  
  backend "s3" {
    bucket = "remote-state-demo-cheni"
    key    = "ec2-module-test"
    region = "us-east-1"
    encrypt        = true
    use_lockfile = true
  }
}