variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "eu-central-1"
}

variable "app_name" {
  description = "Name of the Amplify app"
  type        = string
  default     = "cloud_programming_website"
}

variable "repo_url" {
  description = "GitHub repository URL"
  type        = string
  default     = "https://github.com/dennis-iu/iu_cloud_programming"
}

variable "branch_name" {
  description = "Branch to deploy"
  type        = string
  default     = "main"
}
