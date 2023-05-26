# output "instance_id" {
#   description = "ID of the EC2 instance"
#   value       = aws_instance.jass_app_server.id
# }


# output "instance_public_ip" {
#   description = "Public IP address of the EC2 instance"
#   value       = aws_instance.jass_app_server.public_ip
# }

# output "instance_public_ipv4_DNS" {
#   description = "Public IPv4 DNS address of the EC2 instance"
#   value       = aws_instance.jass_app_server.public_dns
# }

# # Output -For Loop with List (This will work with count)
output "for_output_list" {
  description = "For Loop with list"
  value = [for instance in aws_instance.jass_app_server: instance.public_ip]
  
}

# Output - For Loop with Map
output "for_output_map1" {
  description = "For Loop with Map"
  value = {for instance in aws_instance.jass_app_server: instance.id => instance.public_dns}
}

# Output - For Loop with Map Advanced
output "for_output_map2" {
  description = "For Loop with Map - Advanced"
  value = {for c, instance in aws_instance.jass_app_server: c => instance.public_dns}
}