#Global Vars

variable "env_name" {
  default = "dev"
}

variable "default_tags" {
  default = {
    environment = "dev"
  }
}

## workstation vars
##
variable "eks_cluster_version" {
  description = "version of eks cluster"
  default = "1.19.0" #"1.14.0"
}

variable "aws_ssh_key_name" {
  default = "eks-daytwo-east1-key" #"cs-win-east-1-getsome"
}

variable "aws_workstation_vol_size" {
  default = "20"
}

variable "aws_workstation_instance_type" {
  default = "t2.medium"
}

variable "aws_workstation_count" {
  default = "1"
}
