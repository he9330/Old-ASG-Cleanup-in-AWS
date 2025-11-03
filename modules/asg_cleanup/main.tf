resource "null_resource" "mark_unattached" {
  for_each = toset(local.unattached_asgs)

  provisioner "local-exec" {
    command = <<EOT
      echo "Tagging ASG ${each.value} with MarkedForDelete"
      aws autoscaling create-or-update-tags \
        --tags "ResourceId=${each.value},ResourceType=auto-scaling-group,Key=MarkedForDelete,Value=$(date -u +%Y-%m-%d),PropagateAtLaunch=false"
    EOT
  }
}

data "aws_autoscaling_groups" "all" {}

locals {
  unattached_asgs = data.aws_autoscaling_groups.all.names
}

data "external" "stale_asgs" {
  program = ["bash", "${path.root}/find_old_asgs.sh"]
  query = {
    expiry_days = var.asg_expiry_days
  }
}

resource "aws_autoscaling_group" "cleanup" {
  for_each = toset(try(data.external.stale_asgs.result.old_asgs, []))
  name     = each.value
  min_size = 1  # Set to a valid minimum size
  max_size = 1  # Set to a valid maximum size

  lifecycle {
    prevent_destroy = false
  }
}
