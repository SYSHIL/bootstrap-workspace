resource "tfe_workspace" "workspace" {
  name         = "my-workspace-name"
  organization = "my-org-name"

  vcs_repo {
    identifier     = "my-org/my-repo"
    oauth_token_id = data.tfe_oauth_client.github.oauth_token_id
  }
}