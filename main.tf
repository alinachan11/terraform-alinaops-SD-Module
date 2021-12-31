

resource "aws_instance" "consul_servers" {
  count = var.consul_servers_count

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  subnet_id = var.subnets_id_private[count.index%length(var.subnets_id_private)]
  associate_public_ip_address = var.for_testing_ip
  vpc_security_group_ids = var.security_groups
  key_name               = var.keyname
  iam_instance_profile   = var.consul_join_profile_name
  user_data = local.sd-userdata
  tags = {
    Name = "Consul-Server-${count.index+1}"
    task = "ans-node"
    node_type = "ubuntu"
    consul_server = "true"
    consul_type ="server"
    consul_connect = "true"

  }
  provisioner "file" {
    source      = "${var.keypath}"
    destination = "/home/ubuntu/${var.keypath}"
    connection {   
      type        = "ssh" 
      host        = self.private_ip
      user        = "ubuntu"
      private_key = file(var.keypath) 

      
      bastion_host = var.bh_public_ip
      bastion_user = "ubuntu"
      bastion_private_key = file(var.keypath)        
    }   
  }
}



