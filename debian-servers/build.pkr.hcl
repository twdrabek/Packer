packer {
  required_plugins {
    name = {
      version = ">= 1.1.7"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

build {
    source "proxmox-iso.debian-server" {
        vm_name = "debian-server-8g"
        vm_id = 201
        disks {
            type = "scsi"
            disk_size = "8G"
            storage_pool = "Mass"
            format = "qcow2"
        }
        template_name = "debian-server-8g"
        template_description = "# Debian Bookworm 12.5.0\nBase install\n8Gb of storage"
    }
}