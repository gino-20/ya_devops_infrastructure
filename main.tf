terraform {
 required_providers {
  yandex = {
  source  = "yandex-cloud/yandex"
  version = "0.61.0"
  }
 }
}

variable "IAM" {
  type = string
}

provider "yandex" {
 token     = var.IAM
 cloud_id  = "b1g3jddf4nv5e9okle7p"
 folder_id = "b1gn1o0rpqh2ujqoai1v"
 zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "vm-1" {
    name = "chapter5-lesson2-alexey-v-gaydukov"

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
        nat       = false
    }

    metadata = {
	user-data = "${file("user_meta.txt")}"
    }
}

    output "ip_address" {
        value = yandex_compute_instance.vm-1.network_interface.0.ip_address
    }
