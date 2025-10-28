variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))
  default = [
    {
      vm_name     = "main"
      cpu         = 2
      ram         = 2
      disk_volume = 5
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 2
      disk_volume = 5
    }
  ]
}

resource "yandex_compute_instance" "each_vm" {
  for_each = { for vm in var.each_vm : vm.vm_name => vm }

  name = each.key

  resources {
    cores  = each.value.cpu
    memory = each.value.ram
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      size     = each.value.disk_volume
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    ssh_key = local.ssh_key
  }

}

