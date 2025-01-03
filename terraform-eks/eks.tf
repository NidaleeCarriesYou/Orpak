module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.20.0"  # This is a stable and recent version supporting the arguments
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.27"
  vpc_id          = aws_vpc.eks_vpc.id

  # Correct arguments for this module version
  subnet_ids = [aws_subnet.public_subnet_a.id,aws_subnet.public_subnet_b.id, aws_subnet.private_subnet.id]

  tags = {
    Name = "my-eks-cluster"
  }
}
