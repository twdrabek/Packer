packer {
  required_plugins {
    name = {
      version = ">= 1.1.7"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

build {
    source "proxmox-iso.ubuntu-server" {
        vm_name = "ununtu-server-8g"
        vm_id = 201
        disks {
            type = "scsi"
            disk_size = "8G"
            storage_pool = "Mass"
            format = "qcow2"
        }
        template_name = "ubuntu-server-8g"
        template_description = "# Ubuntu Server 23.10\nBase install\n8Gb of storage"
    }
}