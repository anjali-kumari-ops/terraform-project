module "vpc" {
  source = "./modules/vpc"
  cidr   = "10.0.0.0/16"
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

module "ecr" {
  source = "./modules/ecr"
}

module "alb" {
  source  = "./modules/alb"
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
  alb_sg  = module.security.alb_sg_id
}

module "ecs" {
  source   = "./modules/ecs"
  subnets  = module.vpc.public_subnets
  ecs_sg   = module.security.ecs_sg_id
  blue_tg  = module.alb.blue_tg
}

module "codedeploy" {
  source = "./modules/codeploy"

  cluster_name   = "app-cluster"
  service_name   = "app-service"
  blue_tg_name   = "blue-tg"
  green_tg_name  = "green-tg"
  prod_listener  = module.alb.prod_listener
  test_listener  = module.alb.test_listener
}
