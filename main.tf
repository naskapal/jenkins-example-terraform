provider "google" {
  project     = "kapal-private"
  region      = "asia-southeast2"
  zone        = "asia-southeast-2b"
  credentials = file("keyfile.json")
}

resource "google_cloudbuild_trigger" "manual-trigger" {
  name        = "manual-build"

  source_to_build {
    uri       = "https://github.com/naskapal/dummy-server"
    ref       = "refs/heads/main"
    repo_type = "GITHUB"
  }

  git_file_source {
    path      = "Dockerfile"
    uri       = "https://github.com/naskapal/dummy-server"
    revision  = "refs/heads/main"
    repo_type = "GITHUB"
  }
  approval_config {
     approval_required = true 
  }

}
