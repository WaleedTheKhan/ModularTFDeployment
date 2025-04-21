# Waleed Khan
# April 11, 2025
# This is the EC2 module's main file, where four EC2 instances will be created.
# These instances will run a default website on port 80 and two Docker NGINX containers on ports 8080 and 8081 (one each).

resource "aws_instance" "vm" {
  count         = 4
  ami           = "ami-0c2b8ca1dad447f8a"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_ids[count.index]
  vpc_security_group_ids = [var.security_group_id]

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker
              systemctl start docker
              systemctl enable docker

              # Ports 8080 and 8081 (Docker containers)
              docker run -d -p 8080:80 nginx
              docker run -d -p 8081:80 nginx

              # Port 80 (regular)
              echo "<h1>Hello $HOSTNAME</h1>" > /var/www/html/index.html
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              EOF

  tags = {
    Name = "VM${count.index + 1}"
  }
}
