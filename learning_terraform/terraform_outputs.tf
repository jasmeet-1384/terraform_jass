output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.jass_app_server.id
}


output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.jass_app_server.public_ip
}

output "instance_public_ipv4_DNS" {
  description = "Public IPv4 DNS address of the EC2 instance"
  value       = aws_instance.jass_app_server.public_dns
}

# Output -For Loop with List
output "for_output_list" {
  description = "For loop with list"
  value = [for instance in aws_instance.jass_app_server : instance.public_ip ]
}

