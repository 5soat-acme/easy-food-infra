# Criar a VPC
resource "aws_vpc" "easy-food-vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }

  lifecycle {
    precondition {
      condition     = !((var.public_subnet_cidr_blocks) == length(var.private_subnet_cidr_blocks) == length(var.availability_zones))
      error_message = "As listas 'public_subnet_cidr_blocks', 'private_subnet_cidr_blocks' e 'availability_zones' devem ter o mesmos tamanhos."
    }
  }
}

# Criar subredes públicas
resource "aws_subnet" "public_subnet" {
  count             = length(var.public_subnet_cidr_blocks)
  vpc_id            = aws_vpc.easy-food-vpc.id
  cidr_block        = var.public_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
}

# Criar subredes privadas
resource "aws_subnet" "private_subnet" {
  count             = length(var.private_subnet_cidr_blocks)
  vpc_id            = aws_vpc.easy-food-vpc.id
  cidr_block        = var.private_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
}

# Criar Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.easy-food-vpc.id
}

# Criar Route Table para subredes públicas
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.easy-food-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

# Associar subredes públicas com a Route Table pública
resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.public_subnet_cidr_blocks)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

# Criar Elastic IP para NAT Gateway
resource "aws_eip" "my_eip" {
  domain = "vpc"
}

# Criar NAT Gateway
resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  depends_on = [aws_internet_gateway.my_igw]
}

# Criar Route Table para subredes privadas
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.easy-food-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat_gateway.id
  }
}

# Associar subredes privadas com a Route Table privada
resource "aws_route_table_association" "private_subnet_association" {
  count          = length(var.private_subnet_cidr_blocks)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}