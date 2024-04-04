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

  // provisioner "shell" {
  //   inline = [
  //     "sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config",
  //     "sed -i 's/#PermitTTY yes/PermitTTY yes/g' /etc/ssh/sshd_config",
  //     "systemctl enable ssh",
  //     "systemctl start ssh",
  //   ]
  // }
}