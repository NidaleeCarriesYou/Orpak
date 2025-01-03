resource "aws_lb" "app_lb" {
  name               = "eks-load-balancer"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.eks_sg.id]

  # Include subnets in two different AZs
  subnets = [
    aws_subnet.public_subnet_a.id,
    aws_subnet.public_subnet_b.id
  ]

  enable_deletion_protection = false

  tags = {
    Name = "app-load-balancer"
  }
}
