#locals {
#  ALB_NAME                = "${var.DEFAULT_TAGS["PROJECT_NAME"]}-${var.DEFAULT_TAGS["ENV"]}-alb-${var.DEPLOYMENT}"
#  TG_NAME                 = "${var.DEFAULT_TAGS["PROJECT_NAME"]}-${var.DEFAULT_TAGS["ENV"]}-tg-${var.DEPLOYMENT}"
#}

resource "aws_lb" "alb" {
  name                = lower(local.ALB_NAME)
  internal            = false
  load_balancer_type  = "application"
  security_groups     = [var.ALLOW_WEB_PUBLIC]
  subnets             = var.PUBLIC_SUBNETS
  tags                = {
    Name              = upper(local.ALB_NAME)
  }
}


resource "aws_lb_target_group" "tg-nodes" {
  name     = lower(local.TG_NAME)
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.VPCID
}

resource "aws_lb_target_group_attachment" "instances-attach" {
  count            = length(var.INSTANCEID)
  target_group_arn = aws_lb_target_group.tg-nodes.arn
  target_id        = element(var.INSTANCEID,count.index)
  port             = 80
}

resource "aws_lb_listener" "listener-http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-nodes.arn
  }
}