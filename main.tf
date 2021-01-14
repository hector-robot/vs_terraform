variable "env_xoapw" {
  type = string
  sensitive = true
}

module "k8s" {
  source = "./modules/k8s"

  k8s-master-instances = ["mkube01"]
  k8s-worker-instances = ["kube01","kube02","kube03"]

  template-uuid = "98b1ddaa-91a1-194f-0542-31996a37238f"
  sr-uuid = "0a845594-3607-03f2-5a84-65ba0c7ba85d"
  network-uuid = "00841af1-24c7-59c9-1a70-b710407b4dd2"
            
  k8s-master-memory_size = 4294967296
  k8s-master-disk_size = 21474836480
  k8s-master-cpus = 2

  k8s-worker-memory_size = 4294967296
  k8s-worker-disk_size = 21474836480
  k8s-worker-cpus = 2

  xoapw = var.env_xoapw
}
