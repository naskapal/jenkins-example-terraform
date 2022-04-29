provider "google" {
  project     = "kapal-private"
  region      = "asia-southeast2"
  zone        = "asia-southeast-2b"
}

resource "google_cloudbuild_trigger" "manual-trigger" {
  name        = "manual-build"

  source_to_build {
    uri       = "https://hashicorp/terraform-provider-google-beta"
    ref       = "refs/heads/main"
    repo_type = "GITHUB"
  }

  git_file_source {
    path      = "cloudbuild.yaml"
    uri       = "https://hashicorp/terraform-provider-google-beta"
    revision  = "refs/heads/main"
    repo_type = "GITHUB"
  }
  approval_config {
     approval_required = true 
  }

}
