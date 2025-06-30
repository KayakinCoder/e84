terraform {
  required_providers {
    aws = {
      # aws recommends awscc, using the base for simplicity/speed here
      source = "hashicorp/aws"
      # only update minor versions
      version = "~> 5.5"
    }
  }

  required_version = ">= 1.2.0"
}
