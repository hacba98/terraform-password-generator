terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
}

resource "random_password" "password_generator" {
  length           = var.password_strength
  special          = var.password_special
  override_special = var.password_override_special

  # everytime the string is changed -> store old string to local
  provisioner "local-exec" {
    when    = destroy
    command = "echo ${self.result} >> ./secrets.txt"
  }
}
