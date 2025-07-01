provider "aws" {
    
  region="us-east-1"
}
terraform {
  
  backend "s3" {
    bucket = "remote-state-demo-cheni"
    key    = "aws-module-test-vpc.tfstate"
    region = "us-east-1"
    encrypt        = true
    use_lockfile = true
  }
}