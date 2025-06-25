provider "aws" {
    
  region="ap-south-1"
}
resource "aws_instance" "Demo1" {
    ami="ami-09c813fb71547fc4f"
    instance_type="t3.micro"
}
