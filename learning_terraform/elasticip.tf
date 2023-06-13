#Creating Elastic IP
resource "aws_eip" "jass_eip" {
  instance = module.ec2_public.id[0]
  depends_on = [ module.ec2_public ]
  vpc = true
  tags = local.common_tags

## Local Exec Provisioner:  local-exec provisioner (Destroy-Time Provisioner - Triggered during deletion of Resource)
  provisioner "local-exec" {
    command = "echo Destroy time prov `date` >> destroy-time-prov.txt"
    #working_dir = "local-exec-output-files/"
    when = destroy
    #on_failure = continue
  }  
  }
