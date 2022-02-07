resource "aws_key_pair" "altais-challenge-key-pair" {
    key_name = "altais-challenge-key-pair"
    public_key = "${file(var.public_key_path)}"
}
resource "aws_instance" "apache_instance" {
    ami             = var.instance_ami
    instance_type   = var.instance_type
    key_name        = "${aws_key_pair.altais-challenge-key-pair.id}"
    subnet_id       = aws_subnet.altais-challenge-public-subnet.id
    security_groups = [aws_security_group.ssh-allowed.id]

    user_data = <<-EOF
    #!/bin/bash
    echo "*** Installing apache"
    sudo yum -y install httpd
    sudo echo "<p> ALtais Challenge </p>" >> /var/www/html/index.html
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "*** Completed Installing apache2"
    EOF

    tags = {
        Name = "apache_instance"
    }

    volume_tags = {
        Name = "apache_instance"
    } 
}