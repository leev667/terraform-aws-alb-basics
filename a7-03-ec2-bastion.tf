# AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet
module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"  
  # insert the 10 required variables here
  name                   = "${var.environment}-BastionHost"
  ami                    = data.aws_ami.this.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  subnet_id              = module.vpc.public_subnets[0]
  tags = local.common_tags

  # UPDATED
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]

}

