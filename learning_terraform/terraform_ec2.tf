#resource: EC2 Instance
resource "aws_instance" "jass_app_server" {
  ami           = "ami-0b08bfc6ff7069aff"
  instance_type = "t2.micro"
  user_data = file("${path.module}/jass.sh")

  tags = {
    Name = var.instance_name
  }
}