# Creating External LoadBalancer
resource "aws_lb" "external-alb" {
  name               = "External-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.vpc2_security_group.id]
  subnets            = [aws_subnet.vpc2_subnet1.id, aws_subnet.vpc2_subnet2.id]
}
resource "aws_lb_target_group" "target-elb" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc2.id
}
#resource "aws_lb_target_group_attachment" "attachment1" {
#  target_group_arn = aws_lb_target_group.target-elb.arn
#  target_id        = aws_instance.ec2_instance2.id
#  port             = 80
#  depends_on = [
#    aws_instance.ec2_instance2,
#  ]
#}

resource "aws_lb_target_group_attachment" "attachment" {
  count            = 2
  target_group_arn = aws_lb_target_group.target-elb.arn
  target_id        = aws_instance.ec2_instance2.*.id[count.index]
  port             = 80
  depends_on       = [aws_instance.ec2_instance2]
}
#resource "aws_lb_target_group_attachment" "attachment2" {
#  target_group_arn = aws_lb_target_group.target-elb.arn
#  target_id        = aws_instance.demoinstancetwo.id
#  port             = 80
#  depends_on = [
#    aws_instance.demoinstancetwo,
#  ]
#}
resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.external-alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-elb.arn
  }
}

