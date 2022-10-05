terraform {
 required_providers {
  yandex = {
  source  = "yandex-cloud/yandex"
  version = "0.61.0"
  }
 }
}



resource "yandex_compute_instance" "vm-1" {
    count = 1
    name = "chapter5-lesson2-alexey-v-gaydukov-${count.index}"

    resources {
        cores  = 2
        memory = 2
    }

    boot_disk {
        initialize_params {
            image_id = "fd8ju9iqf6g5bcq77jns"
        }
    }

    network_interface {
        subnet_id = "e9bgji3n08h5drjmfedn"
        nat       = true
    }

    metadata = {
	user-data = "${file("user_meta.txt")}"
    }
}

