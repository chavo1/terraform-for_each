### HCL for_each example
#### Prerequisite

- Install [Terraform](https://www.terraform.io/downloads.html)
```
git clone https://github.com/chavo1/terraform-for_each.git
cd terraform-for_each
terraform init
terraform apply
```
- The result should be as follow
```
null_resource.server["b"]: Creation complete after 0s [id=9127748779930280441]
null_resource.server["a"]: Creation complete after 0s [id=2056307980351462529]
null_resource.server1["default"]: Creation complete after 0s [id=3391358659473562614]
null_resource.server1["latest"]: Creation complete after 0s [id=5458981045469240877]
```