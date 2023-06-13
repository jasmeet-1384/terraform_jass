# Create a Null Resource and Provisioners
resource "null_resource" "name" {
  depends_on = [module.ec2_public]
  #Connection Block for Provisioners to connect to EC2 Instance

  connection {
    type        = "ssh"
    host        = aws_eip.jass_eip.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("private-key/testjasmeet.pem")
  }

  ## File Provisioner: Copies the testjasmeet.pem file to /tmp/testjasmeet.pem
  provisioner "file" {
    source      = "private-key/testjasmeet.pem"
    destination = "/tmp/testjasmeet.pem"
  }
  ## Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/testjasmeet.pem"
    ]
  }

  ## Local Exec Provisioner:  local-exec provisioner (Creation-Time Provisioner - Triggered during Create Resource)
 # provisioner "local-exec" {
   # command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    




#}

}