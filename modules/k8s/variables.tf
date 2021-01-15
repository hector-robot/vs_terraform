variable "k8s-master-instances" {
    type = list(string)
}

variable "k8s-worker-instances" {
    type = list(string)
}

variable "template-uuid" {
    type = string
}

variable "sr-uuid" {
    type = string
}

variable "network-uuid" {
    type = string
}

variable "k8s-master-memory_size" {
    type = number
}

variable "k8s-master-disk_size" {
    type = number
}

variable "k8s-master-cpus" {
    type = number
}

variable "k8s-worker-memory_size" {
    type = number
}

variable "k8s-worker-disk_size" {
    type = number
}

variable "k8s-worker-cpus" {
    type = number
}

variable "xoaurl" {
    type = string
    default = "ws://xoa.hq.vs"
}

variable "xoauser" {
    type = string
    default = "admin"
}

variable "xoapw" {
    type = string
    sensitive = true
}