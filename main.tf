# 1. Cloud-Anbieter und Region setzen
provider "aws" {
  region = "eu-central-1" # Europe (Frankfurt)
}

# 2. Amplify App erstellen
resource "aws_amplify_app" "cloud_programming_app" {
  name = "cloud_programming_website"
  repository = "https://github.com/dennis-iu/iu_cloud_programming"
  oauth_token = var.github_token

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
}

# 3. Automatisches Deployment für Main aktivieren
resource "aws_amplify_branch" "main" {
  app_id = aws_amplify_app.cloud_programming_app.id
  branch_name = "main"
  stage = "PRODUCTION"
  enable_auto_build = true
}
