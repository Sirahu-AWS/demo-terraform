######################################################
# Private subnets
# Each subnet in a different AZ
######################################################
resource "aws_subnet" "private" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.cidr_block, 4, count.index)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name    = "${var.vpc_name}-private- ${var.availability_zones[count.index]}"
    Creator = "SirahuTeam"
  }
}

######################################################
# Public subnets
# Each subnet in a different AZ
######################################################
resource "aws_subnet" "public" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.cidr_block, 4, count.index + 3)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name    = "${var.vpc_name}-public- ${var.availability_zones[count.index]}"
    Creator = "SirahuTeam"
  }
}

######################################################
# NAT gateways  enable instances in a private subnet
# to connect to the Internet or other AWS services,
# but prevent the internet from initiating
# a connection with those instances.
######################################################
resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "main" {
  subnet_id     = aws_subnet.public[0].id
  allocation_id = aws_eip.nat.id

  tags = {
    Name = "${var.vpc_name}-nat"
  }
}