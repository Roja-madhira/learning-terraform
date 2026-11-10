resource "aws_instance" "data-source" {
  instance_type = var.instance_type
  ami = data.aws_ami.DevOps.id
  vpc_security_group_ids = [aws_security_group.data-source.id]

}


resource "aws_security_group" "data-source" {
  name        = "data-source"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port       = var.from_port
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = var.cidr
  }
  
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "roboshop-data-source"
  }
}
