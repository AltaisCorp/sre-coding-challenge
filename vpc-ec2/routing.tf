resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

}
# private
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
}


# public default
resource "aws_route" "public_default" {
  route_table_id = aws_route_table.public.id

  gateway_id             = aws_internet_gateway.main.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private.id
}