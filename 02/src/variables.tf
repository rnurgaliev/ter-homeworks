###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMG1FJ8MscesqvvSZIi5xFyykCA/V543wwtfRpBo2NZz rav@compute-vm-2-2-20-hdd-1755526249128"
  description = "ssh-keygen -t ed25519"
}

##TASK2 VARS

variable "img_fam" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex_compute_image"
}

variable "instanse_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "instanse name"
}

variable "p_id" {
  type        = string
  default     = "standard-v1"
  description = "platform id"
}
