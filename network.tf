resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.altais-challenge-vpc.id
}
resource "aws_subnet" "altais-challenge-public-subnet" {
    vpc_id                  = aws_vpc.altais-challenge-vpc.id
    cidr_block              = "${var.public_subnets}"
    map_public_ip_on_launch = true 
    availability_zone       = "${var.region}a"
}
resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.altais-challenge-vpc.id
    
    route {
        cidr_block = "0.0.0.0/0" 
        gateway_id = aws_internet_gateway.IGW.id
    }
}
resource "aws_route_table_association" "public-rt-association" {
    subnet_id = aws_subnet.altais-challenge-public-subnet.id
    route_table_id = aws_route_table.public-rt.id
 }
 resource "aws_security_group" "ssh-allowed" {
    vpc_id = aws_vpc.altais-challenge-vpc.id
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        // This means, all ip address are allowed to ssh ! 
        // Put your office or home address in it!
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}