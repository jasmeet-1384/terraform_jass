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

# # # Output -For Loop with List (This will work with count)
# output "for_output_list" {
#   description = "For Loop with list"
#   value = [for instance in aws_instance.jass_app_server: instance.public_ip]
  
# }

# # Output - For Loop with Map
# output "for_output_map1" {
#   description = "For Loop with Map"
#   value = {for instance in aws_instance.jass_app_server: instance.id => instance.public_dns}
# }

# # Output - For Loop with Map Advanced
# output "for_output_map2" {
#   description = "For Loop with Map - Advanced"
#   value = {for c, instance in aws_instance.jass_app_server: c => instance.public_dns

# }

# # Output Legacy Splat Operator (latest) - Returns the List
# output "legacy_splat_instance_publicdns" {
#   description = "Legacy Splat Expression"
#   value = aws_instance.jass_app_server.*.public_dns
# }

# # Output Latest Generalized Splat Operator - Returns the List
# output "latest_splat_instance_publicdns" {
#   description = "Generalized Splat Expression"
#   value = aws_instance.jass_app_server[*].public_dns
# }
/*
# EC2 Instance Public IP with TOSET
output "instance_public_ip" {
  description = "EC2 instance public IP"
  value = toset([
    for jass_app_server in aws_instance.jass_app_server: jass_app_server.public_ip
  ])
}


# # EC2 Instance Public DNS with TOSET
output "instance_public_DNS" {
  description = "EC2 Instance public DNS"
  value = toset([
    for jass_app_server in aws_instance.jass_app_server: jass_app_server.public_dns
  ])
}

# EC2 Instance Public DNS with MAPS (tomap)
output "instance_public_dns_map" {
  description = "EC2 Instance with public DNS Maps"
  value = tomap({
    for s, jass_app_server in aws_instance.jass_app_server : s => jass_app_server.public_dns 
    # S intends to be a subnet ID
  })
  
}




# output EC2 instance offerings foreach is set
output "output_jass" {
  value = toset([for t in data.aws_ec2_instance_type_offerings.my_instance_type : t.instance_types])

}

# output EC2 instance offerings map
output "output_jass2" {
  value = {for ja, jass in data.aws_ec2_instance_type_offerings.my_instance_type : ja => jass.instance_types}
}

# Basic Output: All Availability Zones mapped to Supported Instance Types
output "output_jass3" {
 value = { for az, details in data.aws_ec2_instance_type_offerings.my_instance_type :
  az => details.instance_types }   
}

# Filtered Output: Exclude Unsupported Availability Zones
output "output_jass4" {
  value = { for az, details in data.aws_ec2_instance_type_offerings.my_instance_type :
  az => details.instance_types if length(details.instance_types) != 0 }
}

# Filtered Output: with Keys Function - Which gets keys from a Map
# This will return the list of availability zones supported for a instance type
output "output_jass5" {
  value =toset( keys({ for az, details in data.aws_ec2_instance_type_offerings.my_instance_type :
  az => details.instance_types if length(details.instance_types) != 0 }) )
}

# Filtered Output: As the output is list now, get the first item from list (just for learning)
output "output_jass6" {
  value = keys({ for az, details in data.aws_ec2_instance_type_offerings.my_instance_type :
  az => details.instance_types if length(details.instance_types) != 0 })[0]
}
*/
# VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

# VPC CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
} 


# VPC Private Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

# VPC Public Subnets
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

# VPC NAT gateway Public IP
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_public_ips
}

# VPC AZs
output "azs" {
  description = "A list of availability zones spefified as argument to this module"
  value       = module.vpc.azs
}