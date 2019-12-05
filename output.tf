output "ids" {
  value = values(null_resource.server)[*].id
}

output "ids1" {
  value = values(null_resource.server1)[*].id
}

output "shuffled_output" {
  value = random_shuffle.ip.result
}

output "shuffled_output_splat" {
  value = "${random_shuffle.ip_splat.*.result}"
}
# conditional for_each
output "test" {
  value = null_resource.test[*]
}

output "local_file" {
  value = local_file.foo[*]
}