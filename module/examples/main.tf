data "aws_ami" "latest" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

module "s3_name_generator" {
  source      = "../"
  prefix      = var.prefix
  environment = var.environment
  resource    = "s3"
}

resource "aws_s3_bucket" "test_backet" {
  bucket = module.s3_name_generator.name
}

module "ec2_name_generator" {
  source      = "../"
  prefix      = var.prefix
  environment = var.environment
  resource    = "ec2"

}

resource "aws_instance" "test_instance" {
  ami           = data.aws_ami.latest.id
  instance_type = var.instance_type
  tags = {
    Name = module.ec2_name_generator.name
  }
}
