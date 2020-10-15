module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster.name
  cluster_version = var.cluster.version
  subnets         = module.vpc.private_subnets

  vpc_id = module.vpc.vpc_id
  config_output_path = pathexpand("~/.kube/config")
  worker_groups = [
    for w in var.cluster.workerGroups: {
      name = w.name
      instance_type = w.type
      asg_min_size = w.min
      asg_max_size = w.min
      platform = w.platform
    }
  ]
  
}