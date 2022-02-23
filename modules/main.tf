## Terraform configuration

terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
cloud {
  organization = "TechMDOU"
  workspaces {
    name = "Example-Workspace1"
  }
}

}

variable "name_length" {
  description = "The number of words in the pet name"
  default     = "3"
}

variable "pet_count" {
  description = "The number of  pet count needed"
  default     = "5"
}


resource "random_pet" "pet_name" {
  count     = var.pet_count
  length    = var.name_length
  separator = "-"
}

output "pet_name" {
  value = random_pet.pet_name[*].id
}
