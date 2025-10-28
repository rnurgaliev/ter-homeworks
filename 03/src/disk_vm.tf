resource "yandex_compute_disk" "disk_count" {
  count = 3
  name  = "disk_count-${count.index}"
  type  = "network-hdd"
  size  = 1
}

resource "yandex_compute_instance" "storage" {
  name = "storage"
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = "network-hdd"
      size     = 5
    }
  }
  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat                = true
  }
  dynamic "secondary_disk" {
    for_each = { for idx, disk in yandex_compute_disk.disk_count : idx => disk.id }
    content {
      disk_id = secondary_disk.value
    }
  }

}
