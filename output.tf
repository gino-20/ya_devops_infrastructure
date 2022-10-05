output "ip_address_1" {
        value = yandex_compute_instance.vm-1[0].network_interface.0.ip_address
    }
output "ip_address_2" {
        value = yandex_compute_instance.vm-1[1].network_interface.0.ip_address
    }
