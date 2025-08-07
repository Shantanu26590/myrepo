resource "aws_vpc" "myvpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "MyVPC"
  }
}
resource "aws_internet_gateway" "my_IGW" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "IGW"
  }
}
resource "aws_subnet" "Pubsubnet" {
  cidr_block        = "10.10.0.0/24"
  vpc_id            = aws_vpc.myvpc.id
  availability_zone = "ap-south-1a"
  tags = {
    Name = "Pubsubnet"
  }
}
resource "aws_route_table" "MRT" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_IGW.id
  }
  tags = {
    Name = "MRT"
  }
}
resource "aws_route_table_association" "Public_rta" {
  subnet_id      = aws_subnet.Pubsubnet.id
  route_table_id = aws_route_table.MRT.id
}
