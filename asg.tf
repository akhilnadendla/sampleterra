# Define the launch configuration for the instances in the ASG
resource "aws_launch_configuration" "exampleASGconfig" {
  name_prefix     = "example-lc"
  image_id        = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.vpc2_security_group.id]
  key_name        = var.key_name
  user_data       = file("data.sh")

}

# Define the Auto Scaling Group
resource "aws_autoscaling_group" "exampleASG" {
  name                 = "example-asg"
  max_size             = 3
  min_size             = 2
  desired_capacity     = 2
  launch_configuration = aws_launch_configuration.exampleASGconfig.name
  vpc_zone_identifier  = [aws_subnet.vpc2_subnet3.id]
  target_group_arns    = [aws_lb_target_group.target-elb.arn]
  #
  #  # Define scaling policies
  #  scaling_policies {
  #    name                   = "scale-out"
  #    adjustment_type        = "ChangeInCapacity"
  #    scaling_adjustment     = 1
  #    cooldown               = 60
  #  }
  #
  #  scaling_policies {
  #    name                   = "scale-in"
  #    adjustment_type        = "ChangeInCapacity"
  #    scaling_adjustment     = -1
  #    cooldown               = 60
  #  }
}






