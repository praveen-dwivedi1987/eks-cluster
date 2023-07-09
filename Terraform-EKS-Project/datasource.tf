data "aws_vpc" "eks_vpc" {
  default = true
}

data "aws_availability_zones" "az1" {
  state = "available"
  filter {
    name = "zone-name"
    values = ["us-east-1a"]
  }
}

data "aws_availability_zones" "az2" {
  state = "available"
  filter {
    name = "zone-name"
    values = ["us-east-1b"]
  }
}


data "aws_subnet" "sub01" {
  vpc_id = data.aws_vpc.eks_vpc.id
  availability_zone = "us-east-1a"
}

data "aws_subnet" "sub02" {
  vpc_id = data.aws_vpc.eks_vpc.id
  availability_zone = "us-east-1b"
}