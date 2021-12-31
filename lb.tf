resource "aws_lb" "consul_servers_alb" {
  name               = "consul-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            =  var.subnets_id_public
  security_groups    = var.security_groups

  tags = {
    "Name" = "consul-alb-${var.vpc_id}"
  }
}


resource "aws_lb_listener" "consul_servers" {
  load_balancer_arn = aws_lb.consul_servers_alb.arn
  port              = 8500
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.consul_servers.arn
  }
}

resource "aws_lb_target_group" "consul_servers" {
  name     = "consul-servers-target-group"
  port     = 8500
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled = true
    path    = "/"
  }

  tags = {
    "Name" = "consul_server_target_group_${var.vpc_id}"
  }
}

resource "aws_lb_target_group_attachment" "consul_servers" {
  count            = length(aws_instance.consul_servers)
  target_group_arn = aws_lb_target_group.consul_servers.id
  target_id        = aws_instance.consul_servers.*.id[count.index]
  port             = 8500
}
