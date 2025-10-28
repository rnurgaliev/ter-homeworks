resource "yandex_compute_instance" "web" {
  count = 2
  name  = "count-web-${(count.index) + 1}"

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = "network-hdd"
      size     = 5
    }
  }

  resources {
    cores         = 2
    memory        = 1
    core_fraction = 20
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat                = true
  }

  metadata = {
    ssh_key = local.ssh_key
  }

  depends_on = [yandex_compute_instance.each_vm]

}

