resource "aws_instance" "bastion" {
    ami = "ami-08ace71784e9fd346"
    instance_type = var.instance_type
    subnet_id = aws_subnet.public[0].id
    key_name = var.key_pair

    tags = {
      Name = "Bastion-Host"
    }
}