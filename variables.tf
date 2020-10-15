variable "region" { default = "us-east-1" }
variable "awsProfile" { default = "default" }

variable "cluster" {
  type = object({
    name = string
    version = string
    workerGroups = list(object({
      name = string
      min = number
      max = number
      type = string
      platform = string
    }))
  })
}


variable "vpc" {
  type = object({
    name             = string
    cidr             = string
    azs              = list(string)
    privateSubnetIps = list(string)
    publicSubnetIps  = list(string)
    nat              = bool
    tags             = map(string)
  })
}