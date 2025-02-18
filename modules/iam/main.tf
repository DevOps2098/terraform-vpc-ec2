resource "aws_iam_user" "Prasanna" {
  name = var.iam_user_name
}

resource "aws_iam_role" "ec2_vpc_role" {
  name = "EC2_VPC_Admin_Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.account_id}:user/${aws_iam_user.Prasanna.name}"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "ec2_vpc_policy" {
  name        = "EC2_VPC_FullAccess_Policy"
  description = "Policy granting full access to EC2 and VPC"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:*",
          "vpc:*"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.ec2_vpc_role.name
  policy_arn = aws_iam_policy.ec2_vpc_policy.arn
}

resource "aws_iam_user_policy_attachment" "user_role_attachment" {
  user       = aws_iam_user.Prasanna.name
  policy_arn = aws_iam_policy.ec2_vpc_policy.arn
}
