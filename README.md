# SD - Consul Module

A small sd-consul module, creates a 3 consul servers on the private_subnets. also creates an alb.

![](https://res.cloudinary.com/practicaldev/image/fetch/s--OTZRs2cZ--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/8s9ej311bsktsin0xmsm.png)

# Input:
The module accepts the following inputs:
1) vpc_id
2) subnets_id_private
3) subnets_id_public
4) bh_public_ip - the bastion host public ip
5) security_groups

OPTIONAL:
1) consul_servers_count - default value 3
2) keyname and keypath - default value ansible_key
3) consul_join_profile_name - default value opsschool-consul-join

# Output:
The module generates the following outputs:
1) ubuntu_consul_servers_private_addresses
2) consul_lb_dns

