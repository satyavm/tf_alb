data "aws_ami" "amazon" {
  most_recent = true
  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["137112412989"] # Canonical
}

resource "aws_instance" "webserver" {
  ami = data.aws_ami.amazon.id
  instance_type = var.instance_size
  key_name = "devops2024"
  vpc_security_group_ids = [ aws_security_group.websg.id ]
  user_data = <<-EOF
  #!/bin/bash
  yum -y install httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1> This is my test website </h1>" > /var/www/html/index.html
  EOF
  tags = {
    Name  = "webserver"
    AppName = "webapp"
  }
}



