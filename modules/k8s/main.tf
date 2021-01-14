terraform {
  required_providers {
    xenorchestra = {
      source = "terra-farm/xenorchestra"
      version = "0.12.0"
    }
  }
}

provider "xenorchestra" {
  url = "ws://xoa.hq.vs"
  username = "admin"
  password = var.xoapw
}

resource "xenorchestra_vm" "worker_nodes" {
    count               = length(var.k8s-worker-instances)
    memory_max          = var.k8s-worker-memory_size
    cpus                = var.k8s-worker-cpus
    name_label          = var.k8s-worker-instances[count.index]
    name_description    = var.k8s-worker-instances[count.index]
    template = var.template-uuid

    network {
      network_id = var.network-uuid
    }

    disk {
      sr_id             = var.sr-uuid
      name_label        = "kube01-root"
      size              = var.k8s-worker-disk_size
    }

    provisioner "local-exec" {
      command           = "cd ~/projects/vs_ansible && ansible-playbook -i hosts --limit ${var.k8s-worker-instances[count.index]} playbook.yml"
    }
}

resource "xenorchestra_vm" "master_nodes" {
    count               = length(var.k8s-master-instances)
    memory_max          = var.k8s-master-memory_size
    cpus                = var.k8s-master-cpus
    name_label          = var.k8s-master-instances[count.index]
    name_description    = var.k8s-master-instances[count.index]
    template = var.template-uuid

    network {
      network_id = var.network-uuid
    }

    disk {
      sr_id             = var.sr-uuid
      name_label        = "kube01-root"
      size              = var.k8s-master-disk_size
    }

    provisioner "local-exec" {
      command           = "cd ~/projects/vs_ansible && ansible-playbook -i hosts --limit ${var.k8s-master-instances[count.index]} playbook.yml"
    }
}