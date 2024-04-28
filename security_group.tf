data "aws_vpc" "default" {
  default = true
} 


resource "aws_security_group" "websg" {
  name = "websg"
  vpc_id = data.aws_vpc.default.id
  ingress = [{
    description      = "HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
  },
  {
    description      = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
  }]
  
  egress = [{
    description = "ALL"
    from_port = 0
    to_port = 0
    protocol ="-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
  }]
}
