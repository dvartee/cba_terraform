provider "aws" {
 region = var.region
}


resource "aws_security_group" "cba_tf_sg" {
 name        = "cba_tf_sg"
 description = "allow all traffic"
 ingress {
   from_port  = 22
   to_port    = 22
   protocol   = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
 ingress {
   from_port  = 80
   to_port    = 80
   protocol   = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
 egress {
   from_port  = 0
   to_port    = 0
   protocol   = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
 tags = {
   name = "CBAterraformSG"
 }
}

resource "aws_instance" "cba_instance" {
  instance_type = var.instance_type
  security_groups = [aws_security_group.cba_tf_sg.name]
  ami = "ami-08ace71784e9fd346"
  key_name = var.key_pair
  user_data = file("install_apache.sh")


  tags = {
    Name = "CBATerraformInstance"
    }
}