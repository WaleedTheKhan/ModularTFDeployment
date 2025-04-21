# Waleed Khan
# April 11, 2025
# This is the VPC module's main file. Here, a new VPC (VPC_A) with address space 192.168.0.0/16 
# will be deployed with and four public subnets inside of it. Routing for traffic and
# internet gateway igw for the VPC will be handled here as well.

# Creating the VPC with the specified CIDR block of 192.168.0.0/16
resource "aws_vpc" "vpc_a" {
  cidr_block = "192.168.0.0/16"
}

# Creating the internet gateway igw
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_a.id
}

# Creating the four public subnets
resource "aws_subnet" "public" {
  count                   = 4
  vpc_id                  = aws_vpc.vpc_a.id
  cidr_block              = cidrsubnet("192.168.0.0/16", 4, count.index)
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
}

# Creating the route table for public traffic
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc_a.id
}

# Adding a default route to the internet gateway
resource "aws_route" "default" {
  route_table_id         = aws_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Linking all four subnets with the route table
resource "aws_route_table_association" "rta" {
  count          = 4
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.rt.id
}
