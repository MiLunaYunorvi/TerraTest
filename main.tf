terraform {

  # cloud {
  #   organization = "MILUNADEV"

  #    workspaces {
  #     name = "AWSWorkspace"
  #   }
  # }

  required_providers {
    aws = {
    source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

data "aws_vpc" "defaultVPC" {
  default = true
}

variable "instanceName"{
        type = string
        default = "MAQUINAVM"
    validation {
      condition = length(var.instanceName) > 6
      error_message = "Debe tener mas de 6 caracteres."
    }
}
variable "instance_type" {
  type = string
}
variable "instance_name" {
  type = string
}


variable "VMnombres" {
  type = map
  default = {
      "VM1" = {"Name" = "Objeto1", "Prevent_destroy"=true}, 
      "VM2" = {"Name" = "Objeto2", "Prevent_destroy"=false},
  }
}

variable "Nombres" {
  default = ["Mich", "Flori"]
}

# resource "aws_instance" "terraformVM" {
#   for_each = var.VMnombres
#   ami           = "ami-024e6efaf93d85776"
#   instance_type = "t2.micro"
#   key_name = "SSHVMs"
#   tags = {
#     Name = each.value["Name"]
#   }
  
# }




resource "aws_instance" "VM1" {
    ami           = "ami-024e6efaf93d85776"
    instance_type = "t2.micro"
   tags = {
     Name = var.instance_name
   }

}
