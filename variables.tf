terraform {
  required_version = ">= 0.13.5"
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "AWS VPC id"
}

variable "subnets_id_private" {
  description = "Ansible Subnet id"
}

variable "subnets_id_public" {
  description = "public Subnet ids"
  type    = list(string)
}

variable "consul_servers_count" {
  default = 3
}

variable "keyname" {
  default = "ansible_key"
  type = string
}

variable "keypath" {
  default = "ansible_key.pem"
  type = string
}

variable "bh_public_ip" {
  description = "public ip of bastion host"
}

variable "for_testing_ip" {
  description = "incase we want public ip"
  default = false
}

variable "security_groups" {
  description = "security groups for module"
}

variable "consul_join_profile_name" {
  description = "profile name for consul join"
  type = string
  default = "opsschool-consul-join"
}


  