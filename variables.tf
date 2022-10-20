variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "vpc_tags" {
  default = {}
}

variable "public_subnet_cidr_block" {
  default = "10.0.0.0/20"
}

variable "public_subnet_map_instances_public_ip" {
  default = true
}

variable "public_subnet_tags" {
  default = {}
}

variable "private_subnet_cidr_block" {
  default = "10.0.128.0/20"
}

variable "private_subnet_tags" {
  default = {}
}

variable "igw_tags" {
  default = {}
}

variable "instance_ami" {
  default = "ami-08c40ec9ead489470"
}

variable "instance_type" {
  default = "t2.micro"
}
