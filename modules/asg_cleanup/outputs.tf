output "marked_asgs" {
  value = local.unattached_asgs
}

output "deleted_asgs" {
  value = try(data.external.stale_asgs.result.old_asgs, [])
}
