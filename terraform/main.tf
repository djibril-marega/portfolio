provider "aws" {
  region = "eu-west-3"
  
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

# ressource configuration
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  vpc_security_group_ids = [ aws_security_group.app_sg.id ]
  subnet_id = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  key_name = aws_key_pair.ssh_key.key_name

  tags = {
    Name = var.instance_name
  }
}


# network configuration 
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.19.0"

  name = "instenal-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_dns_hostnames    = true
  enable_nat_gateway      = false
}

resource "aws_security_group" "app_sg" {
  name        = "app_sg"
  description = "Allow app frontend access"
  vpc_id      = module.vpc.vpc_id 

  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an SSH key pair for accessing the instances
resource "aws_key_pair" "ssh_key" {
  key_name   = "my-ssh-key"
  public_key = var.ssh_public_key
}