terraform {
  backend "s3" {
    bucket         = "my-terraform-states"
    key            = "asg-cleanup/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
