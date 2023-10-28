resource "aws_instance" "ec2" {
  count = var.counts
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  key_name = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  root_block_device {
    delete_on_termination = var.delete_on_termination
    volume_size = var.volume_size
    volume_type = var.volume_type
  }
  tags = {
    Name =var.machine_name
    OS = var.os
    Managed = "TERRAFORM"
    Module = "EC2"
 }
}