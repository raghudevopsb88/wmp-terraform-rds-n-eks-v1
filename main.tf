module "databases" {
  for_each = var.databases
  source   = "./modules/rds"

  env        = var.env
  subnet_ids = var.subnets

  allocated_storage = each.value["allocated_storage"]
}

module "eks" {
  source = "./modules/eks"

  env        = var.env
  subnet_ids = var.subnets

}


