resource "aws_vpc" "vpc_lab" {
  cidr_block = var.vpc_cidr_block

  tags = merge(
    var.vpc_tags,
    { Name = "vpc-lab" }
  )
}

resource "aws_subnet" "public_subnet_lab" {
  vpc_id                  = aws_vpc.vpc_lab.id
  cidr_block              = var.public_subnet_cidr_block
  map_public_ip_on_launch = var.public_subnet_map_instances_public_ip

  tags = merge(
    var.public_subnet_tags,
    { Name = "public-subnet-lab" }
  )
}

resource "aws_subnet" "private_subnet_lab" {
  vpc_id     = aws_vpc.vpc_lab.id
  cidr_block = var.private_subnet_cidr_block

  tags = merge(
    var.private_subnet_tags,
    { Name = "private-subnet-lab" }
  )
}

resource "aws_internet_gateway" "igw_lab" {
  vpc_id = aws_vpc.vpc_lab.id
}

resource "aws_route_table" "public_rtb_lab" {
  vpc_id = aws_vpc.vpc_lab.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_lab.id
  }
}

resource "aws_route_table_association" "public_rt_lab" {
  subnet_id      = aws_subnet.public_subnet_lab.id
  route_table_id = aws_route_table.public_rtb_lab.id
}

resource "aws_route_table" "private_rtb_lab" {
  vpc_id = aws_vpc.vpc_lab.id
}

resource "aws_route_table_association" "private_rt_lab" {
  subnet_id      = aws_subnet.private_subnet_lab.id
  route_table_id = aws_route_table.private_rtb_lab.id
}

resource "aws_security_group" "allow_ssh" {
  vpc_id      = aws_vpc.vpc_lab.id
  name        = "allow-ssh"
  description = "Allows SSH ingress and all egress traffic."

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}