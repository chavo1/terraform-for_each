locals {
  my_list = [
    "a",
    "b"
  ]
}

locals {
  my_map = {
    default = "c",
    latest  = "d"
  }
}

resource "null_resource" "server" {
  for_each = toset(local.my_list)
}

resource "null_resource" "server1" {
  for_each = tomap(local.my_map)
}
