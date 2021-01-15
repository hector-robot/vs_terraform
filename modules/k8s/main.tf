terraform {
  required_providers {
    xenorchestra = {
      source = "terra-farm/xenorchestra"
      version = "0.12.0"
    }
  }
}

provider "xenorchestra" {
  url       = var.xoaurl
  username  = var.xoauser
  password  = var.xoapw
}

resource "xenorchestra_vm" "worker_nodes" {
    #count               = length(var.k8s-master-instances)
    for_each = toset(var.k8s-worker-instances)
    memory_max          = var.k8s-worker-memory_size
    cpus                = var.k8s-worker-cpus
    name_label          = each.key
    name_description    = each.key
    template            = var.template-uuid

    network {
      network_id = var.network-uuid
    }

    disk {
      sr_id             = var.sr-uuid
      name_label        = "${each.key}-root"
      size              = var.k8s-worker-disk_size
    }

    provisioner "local-exec" {
      command           = "cd ~/projects/vs_ansible && ansible-playbook -i hosts --limit ${each.key} playbook.yml"
    }
}

resource "xenorchestra_vm" "master_nodes" {
    #count               = length(var.k8s-master-instances)
    for_each = toset(var.k8s-master-instances)
    memory_max          = var.k8s-master-memory_size
    cpus                = var.k8s-master-cpus
    name_label          = each.key
    name_description    = each.key
    template            = var.template-uuid

    network {
      network_id = var.network-uuid
    }

    disk {
      sr_id             = var.sr-uuid
      name_label        = "${each.key}-root"
      size              = var.k8s-master-disk_size
    }

    provisioner "local-exec" {
      command           = "cd ~/projects/vs_ansible && ansible-playbook -i hosts --limit ${each.key} playbook.yml"
    }
}