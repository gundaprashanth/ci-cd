provider "aws" {
  region = "ap-south-1"
  profile = "default"
}
resource "aws_instance" "my_instance" {
  instance_type = "t2.micro"
  availability_zone = "ap-south-1a"
  ami = "ami-0a0f1259dd1c90938"
  key_name = "demo-project"
  tags = {
    Name = "myec2"
  }
  security_groups = ["demo-sg"]
}

resource "aws_security_group" "demo-sg"{
  name = "demo-sg"
  description = "SSH ACCESS"
  ingress {
    from_port = "22"
    to_port= "22"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}