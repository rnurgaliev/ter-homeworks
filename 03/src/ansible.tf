resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tftpl", {
    web     = yandex_compute_instance.web
    each_vm = yandex_compute_instance.each_vm
    storage = [yandex_compute_instance.storage]
  })
  filename = "${abspath(path.module)}/hosts.ini"
}

