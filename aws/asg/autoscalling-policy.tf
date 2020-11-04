# Scaleup
resource "aws_autoscaling_policy" "scaleup_policy" {
  name                   = "scaleup-${var.service.environment}-${var.service.name}"
  scaling_adjustment     = "1"
  adjustment_type        = "ChangeInCapacity"
  cooldown               = var.scaleup.cooldown
  autoscaling_group_name = module.rolling_update.this_autoscaling_group_id
  policy_type            = var.scaleup.policy
}

resource "aws_cloudwatch_metric_alarm" "cloudwatch_metrix" {
  alarm_name                = "scaleup-${var.service.environment}-${var.service.name}"
  alarm_description         = "${var.service.name}-alarm-scaleup"
  comparison_operator       = var.scaleup.comparation
  evaluation_periods        = "2"
  metric_name               = var.scaleup.metrix
  namespace                 = "AWS/EC2"
  period                    = "60"
  statistic                 = "Average"
  threshold                 = var.scaleup.threshold
  insufficient_data_actions = []

  dimensions = {
    AutoScalingGroupName = module.rolling_update.this_autoscaling_group_id
  }

  alarm_actions     = ["${aws_autoscaling_policy.scaleup_policy.arn}"]
}

# Scaledown
resource "aws_autoscaling_policy" "scaledown_policy" {
  name                   = "scaledown-${var.service.environment}-${var.service.name}"
  scaling_adjustment     = "-1"
  adjustment_type        = "ChangeInCapacity"
  cooldown               = var.scaledown.cooldown
  autoscaling_group_name = module.rolling_update.this_autoscaling_group_id
  policy_type            = var.scaledown.policy
}

resource "aws_cloudwatch_metric_alarm" "prod-pv-scaledown" {
  alarm_name                = "scaledown-${var.service.environment}-${var.service.name}"
  alarm_description         = "${var.service.name}-alarm-scaledown"
  comparison_operator       = var.scaledown.comparation
  evaluation_periods        = "2"
  metric_name               = var.scaledown.metrix
  namespace                 = "AWS/EC2"
  period                    = "60"
  statistic                 = "Average"
  threshold                 = var.scaledown.threshold
  insufficient_data_actions = []

  dimensions = {
    AutoScalingGroupName = module.rolling_update.this_autoscaling_group_id
  }

  alarm_actions     = ["${aws_autoscaling_policy.scaledown_policy.arn}"]
}
