output "iam_role_arn" {
  value = aws_iam_role.ec2_vpc_role.arn
}

output "iam_user_name" {
  value = aws_iam_user.Prasanna.name
}
