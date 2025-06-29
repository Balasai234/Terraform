output "public_ip" {
    value = aws_instance.this.public_ip
  
}
output "private" {
    value = aws_instance.this.private_ip
  
}
output "instance_id" {
    value = aws_instance.this.id
  
}