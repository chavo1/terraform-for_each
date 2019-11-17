### HCL for_each, splat example
#### Prerequisite

- Install [Terraform](https://www.terraform.io/downloads.html)
```
git clone https://github.com/chavo1/terraform-for_each.git
cd terraform-for_each
terraform init
terraform apply
```
- The result should be something as follow
```
null_resource.server["b"]: Creation complete after 0s [id=9127748779930280441]
null_resource.server["a"]: Creation complete after 0s [id=2056307980351462529]
null_resource.server1["default"]: Creation complete after 0s [id=3391358659473562614]
null_resource.server1["latest"]: Creation complete after 0s [id=5458981045469240877]
random_shuffle.ip_splat: Creating...
random_shuffle.ip: Creating...
random_shuffle.ip_splat: Creation complete after 0s [id=-]
random_shuffle.ip: Creation complete after 0s [id=-]
```
- The output
```
Outputs:

ids = [
  "7148990722623508463",
  "4831811635162832969",
]
ids1 = [
  "5854111308685291383",
  "1404843930870636647",
]
shuffled_output = [
  "192.168.0.4",
  "192.168.0.1",
  "192.168.0.5",
  "192.168.0.2",
  "192.168.0.3",
]
shuffled_output_splat = [
  [
    "192.168.0.7",
    "192.168.0.9",
    "192.168.0.6",
    "192.168.0.8",
    "192.168.0.10",
  ],
]
```