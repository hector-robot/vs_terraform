terraform {
  required_providers {
    xenorchestra = {
      source = "terra-farm/xenorchestra"
      version = "0.11.1"
    }
  }
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
    template = "f5ee1260-852f-e0e1-812d-c4150f9543de"
    network {
      network_id = "00841af1-24c7-59c9-1a70-b710407b4dd2"
    }

    disk {
      sr_id = "ac4c4353-8f47-504f-b551-a9fe8a12070e"
      name_label = "kube01-root"
      size = 32212254720 
    }
}
resource "xenorchestra_vm" "kube02" {
    memory_max = 2147483648
    cpus  = 1
    name_label = "kube02"
    name_description = "kube02"
    template = "f5ee1260-852f-e0e1-812d-c4150f9543de"
    network {
      network_id = "00841af1-24c7-59c9-1a70-b710407b4dd2"
    }

    disk {
      sr_id = "ac5ddd99-e330-673e-4655-c619faa0f8e5"
      name_label = "kube02-root"
      size = 32212254720 
    }
}
resource "xenorchestra_vm" "kube03" {
    memory_max = 2147483648
    cpus  = 1
    name_label = "kube03"
    name_description = "kube03"
    template = "f5ee1260-852f-e0e1-812d-c4150f9543de"
    network {
      network_id = "00841af1-24c7-59c9-1a70-b710407b4dd2"
    }

    disk {
      sr_id = "cea0d932-0164-49ca-73a2-c65a1743bd78"
      name_label = "kube03-root"
      size = 32212254720 
    }
}
