
module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
  tags               = var.tags
}

module "security_groups" {
  source   = "./modules/security_groups"
  vpc_id   = module.vpc.vpc_id
  ssh_cidr = var.ssh_ingress_cidr
  tags     = var.tags
}

# EC2: Jenkins (t3.large, Ubuntu)
module "ec2_jenkins" {
  source        = "./modules/ec2-jenkins"
  subnet_id     = module.vpc.public_subnet_id
  ids        = [module.security_groups.jenkins_id, module.security_groups.ssh_id]
  key_name      = var.key_name
  instance_type = "t3.large"
  tags          = merge(var.tags, { Name = "${var.project}-jenkins" })
}

# EC2: SonarQube (t3.large, Ubuntu)
module "ec2_sonarqube" {
  source        = "./modules/ec2-sonarqube"
  subnet_id     = module.vpc.public_subnet_id
  ids        = [module.security_groups.sonarqube_id, module.security_groups.ssh_id]
  key_name      = var.key_name
  instance_type = "t3.large"
  tags          = merge(var.tags, { Name = "${var.project}-sonarqube" })
}

# EC2: Nexus (t3.large, Ubuntu)
module "ec2_nexus" {
  source        = "./modules/ec2-nexus"
  subnet_id     = module.vpc.public_subnet_id
  ids        = [module.security_groups.nexus_id, module.security_groups.ssh_id]
  key_name      = var.key_name
  instance_type = "t3.large"
  tags          = merge(var.tags, { Name = "${var.project}-nexus" })
}

# EC2: Docker host (t2.medium, Ubuntu)
module "ec2_docker" {
  source        = "./modules/ec2-docker"
  subnet_id     = module.vpc.public_subnet_id
  ids        = [module.security_groups.ssh_id]
  key_name      = var.key_name
  instance_type = "t2.medium"
  tags          = merge(var.tags, { Name = "${var.project}-docker" })
}
