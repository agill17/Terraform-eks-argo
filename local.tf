locals {
  baseTags = { "Author" : "Amrit Gill", "kubernetes.io/cluster" : var.cluster.name }
}

locals {
  vpcTags = merge(local.baseTags, var.vpc.tags)
}