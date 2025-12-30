
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "jenkins_public_ip" {
  value = module.ec2_jenkins.public_ip
}

output "sonarqube_public_ip" {
  value = module.ec2_sonarqube.public_ip
}

output "nexus_public_ip" {
  value = module.ec2_nexus.public_ip
}

output "docker_public_ip" {
  value = module.ec2_docker.public_ip
}
