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
    name = "Example-Workspace2"
  }
}

}
module "randompet" {
    source = "c:/Users/sonyy/DevOps/TF/modules/randompet"
}

resource "local_file" "example" {
    filename = "${path.module}/example.txt"
    content =<<-EOT
    name = example.txt
    name: ["${module.randompet.pet_name[0]}"]
    name: ["${module.randompet.pet_name[1]}"]
    name: ["${module.randompet.pet_name[2]}"]
    name: ["${module.randompet.pet_name[3]}"]
    name: ["${module.randompet.pet_name[4]}"]
    EOT
}

#data "archive_file" "init" {
#  type        = "zip"
#  source_file = "./example.txt"
#  output_path = "example.zip"
#}

#resource "local_file" "example2" {
#    filename = "example2.txt"
#    content =<<-EOT
#    content = local_file.example.id
#    sha = ["sha256(filebase64("files/init.zip"))"]
#    EOT
#}

output "file_attributes" {
   value = local_file.example.content
}
