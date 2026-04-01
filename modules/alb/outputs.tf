output "prod_listener" {
  value = aws_lb_listener.prod.arn
}

output "test_listener" {
  value = aws_lb_listener.test.arn
}

output "blue_tg" {
  value = aws_lb_target_group.blue.arn
}

output "green_tg" {
  value = aws_lb_target_group.green.arn
}

output "alb_arn" {
  value = aws_lb.alb.arn
}
