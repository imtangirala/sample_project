variable "region" {
  type        = string
  description = "AWS region"
  default     = "ap-south-1"
}
variable "machine_name" {
  type        = string
  description = "name of the machine"
  default     = ""
}
variable "os" {
  type        = string
  description = "name of the machine"
  default     = ""
}
variable "counts" {
  type        = number
  default     = 1
}
variable "ami" {
  type        = string
  description = "ami for rhel8"
  default     = "ami-05102cba58d91b74a"
}
variable "instance_type" {
  type        = string
  default     = ""
}
variable "subnet_id" {
  type        = string
  default     = ""
}
variable "key_name" {
  type        = string
  default     = ""
}
variable "vpc_security_group_ids" {
  type        = list(string)
}
variable "delete_on_termination" {
  type        = bool
  default     = true
}
variable "volume_size" {
  type        = number
  default     = 50
}
variable "volume_type" {
  type        = string
  default     = "gp3"
}
variable "tags" {
  type        = map(string)
  default     = {
    Name = "Created by terraform"
    OS = "REDHAT"
    Managed = "TERRAFORM"
    Module = "EC2"
 }
 description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
}