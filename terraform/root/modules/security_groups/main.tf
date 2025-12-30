
# SSH SG - restrict this for security
resource "aws_security_group" "ssh" {
  name        = "ssh-${var.tags.Project}"
  description = "Allow SSH"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr]  # ideally your IP/32
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "ssh-${var.tags.Project}" })
}

# Jenkins (8080)
resource "aws_security_group" "jenkins" {
  name        = "jenkins-${var.tags.Project}"
  description = "Allow TCP 8080 for Jenkins"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # adjust to restrict
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "jenkins-${var.tags.Project}" })
}

# SonarQube (9000)
resource "aws_security_group" "sonarqube" {
  name        = "sonarqube-${var.tags.Project}"
  description = "Allow TCP 9000 for SonarQube"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # adjust to restrict
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "sonarqube-${var.tags.Project}" })
}

# Nexus (8081)
resource "aws_security_group" "nexus" {
  name        = "nexus-${var.tags.Project}"
  description = "Allow TCP 8081 for Nexus"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # adjust to restrict
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "nexus-${var.tags.Project}" })
}
