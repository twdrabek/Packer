packer {
  required_plugins {
    name = {
      version = ">= 1.1.7"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

build {
  sources = [
    "source.proxmox-iso.kali-rolling-lab",
    ]

  provisioner "shell" {
    only = [
    "source.proxmox-iso.kali-rolling-lab"
    ]
  }
    
}