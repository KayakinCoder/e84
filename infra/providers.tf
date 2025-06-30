# our primary aws workloads account
provider "aws" {
  region              = "us-west-2"
  shared_config_files = ["~/.aws/config"]
  profile             = "some-profile"
  # prevent accidental deployment to wrong aws account
  allowed_account_ids = ["123456789123"]

  # tag all resources with
  default_tags {
    tags = {
      env = "dev"
    }
  }
}
