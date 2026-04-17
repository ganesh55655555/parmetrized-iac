resource "aws_security_group" "sg" {
  name = "jenkins-sg"

  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2" {
  count         = var.instance_count
  ami           = "ami-0abcdef1234567890"  # ⚠️ replace with valid AMI
  instance_type = var.instance_type

  security_groups = [aws_security_group.sg.name]

  tags = {
    Name = "${var.instance_name}-${count.index}"
  }
}
