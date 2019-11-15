output "ids" {
  value = values(null_resource.server)[*].id
}

output "ids1" {
  value = values(null_resource.server1)[*].id
}
