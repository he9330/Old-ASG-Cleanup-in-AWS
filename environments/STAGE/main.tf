module "asg_cleanup" {
  source          = "../../modules/asg_cleanup"
  region          = "us-east-1"
  asg_expiry_days = 7
}
