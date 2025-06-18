# AWS Amplify App mit dem gegebenen GitHub-Repository erstellen
resource "aws_amplify_app" "cloud_programming_app" {
  name        = var.app_name
  repository  = var.repo_url

# Amplify App erstellen
  build_spec = <<BUILD_SPEC
version: 1
frontend:
  phases:
    build:
      commands: []
  artifacts:
    baseDirectory: /
    files:
      - '**/*'
  cache:
    paths: []
BUILD_SPEC

  lifecycle {
    prevent_destroy = true
    ignore_changes = [oauth_token]
  }
}

# Automatisches Deployment für main Branch aktivieren
resource "aws_amplify_branch" "main" {
  app_id            = aws_amplify_app.cloud_programming_app.id
  branch_name       = var.branch_name
  stage             = "PRODUCTION"
  enable_auto_build = true
}
