provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket         = "terraform-state-vitmer-eu-central-1"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"
  name    = "main-vpc"
  cidr    = var.vpc_cidr

  azs             = ["${var.aws_region}a", "${var.aws_region}b"]
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "backend" {
  source              = "./modules/backend"
  s3_bucket_name      = "terraform-state-vitmer-eu-central-1"
  dynamodb_table_name = "terraform-locks"
}

module "ecs" {
  source     = "./modules/ecs"
  vpc_id     = module.vpc.vpc_id
  subnets    = module.vpc.public_subnets
  db_address = module.rds.db_address
  bucket_name = module.s3.bucket_name
  ecs_instance_type = var.ecs_instance_type
}

module "rds" {
  source       = "./modules/rds"
  vpc_id       = module.vpc.vpc_id
  subnets      = module.vpc.private_subnets
  db_username  = var.db_username
  db_password  = var.db_password
  db_instance_type = var.db_instance_type
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.s3_bucket_name
}

module "route53" {
  source   = "./modules/route53"
  alb_dns  = module.ecs.alb_dns_name
  alb_zone_id = module.ecs.alb_zone_id
  domain   = var.route53_domain
}

module "iam" {
  source = "./modules/iam"
  vpc_id = module.vpc.vpc_id  
}

module "cloudwatch" {
  source            = "./modules/cloudwatch"
  ecs_cluster_name = module.ecs.ecs_cluster_name  
}

module "ses" {
  source = "./modules/ses"
  domain = var.ses_domain
}

module "sns" {
  source     = "./modules/sns"
  topic_name = var.sns_topic_name
}