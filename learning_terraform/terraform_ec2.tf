#resource: EC2 Instance
resource "aws_instance" "jass_app_server" {
  ami           = "ami-0b08bfc6ff7069aff"
  instance_type = var.instance_type
  key_name = var.insatance_key_pair
  user_data     = file("${path.module}/jass.sh")

  tags = {
    Name = var.instance_name
  }
}
