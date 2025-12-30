
output "ssh_id" {
  value = aws_security_group.ssh.id
}

output "jenkins_id" {
  value = aws_security_group.jenkins.id
}

output "sonarqube_id" {
  value = aws_security_group.sonarqube.id
}

output "nexus_id" {
  value = aws_security_group.nexus.id
}
