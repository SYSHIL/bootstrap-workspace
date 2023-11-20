terraform {
  backend "remote" {
    organization = "revdev"
    workspaces {
      name = "bootstrap-workspace"
    }
  }
}

provider "tfe" {}

resource "tfe_organization" "revdev" {
  name                     = "revdev"
  email                    = "ilhan.syed@gmail.com"
  collaborator_auth_policy = "password"
  cost_estimation_enabled  = true
}



data "tfe_oauth_client" "client" {
  organization = "revdev"
  name         = "revdev"
}

data "terraform_remote_state" "bootstrap" {
  backend = "remote"

  config = {
    organization = "your-organization-name"
    workspaces = {
      name = "bootstrap"
    }
  }
}

# output "oauth_token_id" {
#   value = data.tfe_oauth_client.client.oauth_token_id
# }


# resource "tfe_workspace" "example" {
#   for_each = toset(["workspace1", "workspace2"]) // Add more workspace names here

#   name        = each.key
#   organization = "your-organization-name"
#   vcs_repo {
#     identifier = "your-github-username/tf-github"
#     display_identifier = "your-github-username/tf-github"
#     oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
#   }
# }
