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
  prefix      = "myproject"
  environment = "dev"
  resource    = "s3"
}

resource "aws_s3_bucket" "test_backet" {
  bucket = module.s3_name_generator.name
}

module "ec2_name_generator" {
  source      = "../"
  prefix      = "myproject"
  environment = "dev"
  resource    = "ec2"

}

resource "aws_instance" "test_instance" {
  ami           = data.aws_ami.latest.id
  instance_type = "t2.micro"
  tags = {
    Name = module.ec2_name_generator.name
  }
}

module "iam_name_generator" {
  source      = "../"
  prefix      = "myproject"
  environment = "dev"
  resource    = "iam"
}

resource "aws_iam_role" "test_role" {
  name = module.iam_name_generator.name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}
