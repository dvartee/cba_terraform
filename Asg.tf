
resource "aws_launch_template" "backend_lt" {
  name          = "backend-launch-template"
  image_id      = "ami-08ace71784e9fd346" # Replace with a valid AMI ID
  instance_type = "t2.micro"

  key_name      = var.key_pair # Make sure this exists
}

resource "aws_autoscaling_group" "backend" {
  launch_template {
    id      = aws_launch_template.backend_lt.id   # <- This must match exactly
    version = "$Latest"
  }

  min_size         = 1
  max_size         = 3
  vpc_zone_identifier = [aws_subnet.private[0].id]
}