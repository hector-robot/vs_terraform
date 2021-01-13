terraform {
  required_providers {
    xenorchestra = {
      source = "terra-farm/xenorchestra"
      version = "0.11.1"
    }
  }
}

locals {
  template-uuid = "98b1ddaa-91a1-194f-0542-31996a37238f"
  sr-uuid = "0a845594-3607-03f2-5a84-65ba0c7ba85d"
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
    memory_max = 4294967296
    cpus  = 2
    name_label = "kube01"
    name_description = "kube01"
    template = local.template-uuid
    network {
      network_id = "00841af1-24c7-59c9-1a70-b710407b4dd2"
    }

    disk {
      sr_id = local.sr-uuid
      name_label = "kube01-root"
      size = 21474836480
    }

    provisioner "local-exec" {
      command = "cd ~/projects/vs_ansible && ansible-playbook -i hosts --limit kube01 playbook.yml"
    }
}
resource "xenorchestra_vm" "kube02" {
    memory_max = 4294967296
    cpus  = 2
    name_label = "kube02"
    name_description = "kube02"
    template = local.template-uuid
    network {
      network_id = "00841af1-24c7-59c9-1a70-b710407b4dd2"
    }

    disk {
      sr_id = local.sr-uuid
      name_label = "kube02-root"
      size = 21474836480
    }

    provisioner "local-exec" {
      command = "cd ~/projects/vs_ansible && ansible-playbook -i hosts --limit kube02 playbook.yml"
    }
}
resource "xenorchestra_vm" "kube03" {
    memory_max = 4294967296
    cpus  = 2
    name_label = "kube03"
    name_description = "kube03"
    template = local.template-uuid
    network {
      network_id = "00841af1-24c7-59c9-1a70-b710407b4dd2"
    }

    disk {
      sr_id = local.sr-uuid
      name_label = "kube03-root"
      size = 21474836480
    }

    provisioner "local-exec" {
      command = "cd ~/projects/vs_ansible && ansible-playbook -i hosts --limit kube03 playbook.yml"
    }
}

resource "xenorchestra_vm" "mkube01" {
    memory_max = 2147483648
    cpus  = 2
    name_label = "mkube01"
    name_description = "mkube01"
    template = local.template-uuid
    network {
      network_id = "00841af1-24c7-59c9-1a70-b710407b4dd2"
    }

    disk {
      sr_id = local.sr-uuid
      name_label = "mkube01-root"
      size = 21474836480
    }

    provisioner "local-exec" {
      command = "cd ~/projects/vs_ansible && ansible-playbook -i hosts --limit mkube01 playbook.yml"
    }
}
