locals {
  ip_range = [for val in tolist([100, 103, 102]): "172.31.64.${val}"]
}

resource "aws_network_interface" "foo" {

  for_each    = toset(local.ip_range)

  subnet_id   = "subnet-16387828"
  
  private_ips = [each.key]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "web" {

  for_each      = toset(local.ip_range)

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  
  network_interface {
    network_interface_id = aws_network_interface.foo[each.key].id
    device_index         = 0
  }  

  tags = {
    Name = "chavo"
  }
}
