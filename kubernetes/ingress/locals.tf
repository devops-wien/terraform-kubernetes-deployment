locals {
  name = "${var.name}-${replace(var.dns_name, "_","-")}"
}