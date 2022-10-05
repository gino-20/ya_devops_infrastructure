output "ip_address_1" {
        value = values(yandex_compute_instance.vm-1)[*].network_interface.0.ip_address
    }
