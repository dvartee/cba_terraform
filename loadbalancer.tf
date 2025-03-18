resource "aws_lb" "Internet" {
    name = "Internet-LB"
    load_balancer_type = "application"
    subnets = aws_subnet.public[*].id 

    tags = {
      Name = "Internet-LB"
    }
}

resource "aws_lb" "Internal" {
  name = "Internal-LB"
  load_balancer_type = "application"
  internal = true
  subnets = aws_subnet.private[*].id

  tags = {
    Name = "Internal-LB"
  }
}
