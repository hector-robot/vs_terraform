terraform {
  required_providers {
    xenorchestra = {
      source = "terra-farm/xenorchestra"
      version = "0.11.1"
    }
  }
}

locals {
  template-uuid = "6d0c08cc-82ab-b57d-729d-db3195dd59f0"
}

variable "xoaurl" { }
variable "xoauser" { }
variable "xoapassword" { }


provider "xenorchestra" {
  url		= var.xoaurl
  username	= var.xoauser
  password	= var.xoapassword
}

resource "xenorchestra_vm" "kube01" {
    memory_max = 2147483648
    cpus  = 1
    name_label = "kube01"
    name_description = "kube01"
    template = local.template-uuid
    network {
      network_id = "00841af1-24c7-59c9-1a70-b710407b4dd2"
    }

    disk {
      sr_id = "ac4c4353-8f47-504f-b551-a9fe8a12070e"
      name_label = "kube01-root"
      size = 21474836480
    }
}
resource "xenorchestra_vm" "kube02" {
    memory_max = 2147483648
    cpus  = 1
    name_label = "kube02"
    name_description = "kube02"
    template = local.template-uuid
    network {
      network_id = "00841af1-24c7-59c9-1a70-b710407b4dd2"
    }

    disk {
      sr_id = "ac4c4353-8f47-504f-b551-a9fe8a12070e"
      name_label = "kube02-root"
      size = 21474836480
    }
}
resource "xenorchestra_vm" "kube03" {
    memory_max = 2147483648
    cpus  = 1
    name_label = "kube03"
    name_description = "kube03"
    template = local.template-uuid
    network {
      network_id = "00841af1-24c7-59c9-1a70-b710407b4dd2"
    }

    disk {
      sr_id = "ac4c4353-8f47-504f-b551-a9fe8a12070e"
      name_label = "kube03-root"
      size = 21474836480
    }
}
