# store the terraform state file in s3 and lock with dynamodb
terraform {
  backend "s3" {
    bucket         = "taofeek-nest-terraform-state-file"
    key            = "terraform-nest-app/terraform.tfstate"
    region         = "us-east-1"
    profile        = "terraform-user"
    dynamodb_table = "terraform-nest-app-website-state-lock"
  }
}