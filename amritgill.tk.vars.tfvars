vpc = {
  name             = "amritgill.tk"
  cidr             = "10.0.0.0/16"
  azs              = ["us-east-1a", "us-east-1b", "us-east-1c"]
  privateSubnetIps = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  publicSubnetIps  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  nat              = true
  tags             = { "Purpose" : "EKS-Cluster" }
}

cluster = {
  name = "amritgill-tk"
  version = "1.18"
  workerGroups = [
    {
      name = "infra"
      min = 1
      max = 5
      type = "t2.medium"
      platform = "linux"
    },
    { 
      name = "app" 
      min = 1
      max = 5
      type = "t2.medium"
      platform = "linux"
    }
  ]
}