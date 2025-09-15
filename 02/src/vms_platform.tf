variable "vm_db_img_fam" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex_compute_image"
}

variable "vm_db_instanse_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "instanse name"
}

variable "vm_db_p_id" {
  type        = string
  default     = "standard-v1"
  description = "platform id"
}
