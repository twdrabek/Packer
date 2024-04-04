source "proxmox-iso" "ubuntu-server" {
  /*
    # Ubuntu Server
  */
    # VM OS Settings
    # (Option 1) Local ISO File
  iso_file = var.ISO_FILE
    # - or -
    # (Option 2) Download ISO
  // iso_checksum = "sha256:c150608cad5f8ec71608d0713d487a563d9b916a0199b1414b6ba09fce788ced"
  // iso_url = "https://cdimage.kali.org/kali-2024.1/kali-linux-2024.1-installer-amd64.iso"
  iso_storage_pool = var.ISO_STORAGE_POOL

  /*
    ### Connection Settings
  */
  proxmox_url = var.PM_API_URL
  insecure_skip_tls_verify = var.PM_TLS_INSECURE
  username = "${var.PM_API_TOKEN_ID}"
  token = "${var.PM_API_TOKEN_SECRET}"


  /*
    ### General Settings
  */
  node = "pve"
  // pool = ""
  // vm_id = var.VM_ID
  // vm_name = var.VM_NAME
  onboot = false

  /*
    ### OS Settings
  */
  os = "l26"
  disable_kvm = false

  /*
    ### System Settings
  */
  vga {
    type = "std"
    memory = "32"
  }
  bios = "seabios"
  machine = "q35"
  qemu_agent = true

  /*
    ### Disk Settings
  */
  scsi_controller = "virtio-scsi-single"
  // disks {
  //   type = "scsi"
  //   // disk_size = var.DISK_SIZE
  //   storage_pool = "Mass"
  //   format = "qcow2"
  // }

  /*
    ### CPU Settings
  */
  sockets = 2
  cores = 2
  cpu_type = "host"

  /*
    ### Memory Settings
  */
  memory = 8192
  ballooning_minimum = 4096

  /*
    ### Network Settings
  */
  network_adapters {
      model = "virtio"
      bridge = "vmbr0"
      firewall = false
    }
  // nameserver = 
  // searchdomain = 
    /*
      ### PACKER Boot Commands
    */
    boot_wait = "5s"
    boot_command = [
      "<wait>"
    ]
    boot = "c"

    # PACKER Autoinstall Settings
    http_directory = "http" 
    # (Optional) Bind IP Address and Port
    # http_bind_address = "0.0.0.0"
    # http_port_min = 8802
    # http_port_max = 8802

  /*
    ### Cloud-Init Settings

    cloud_init (bool) - If true, add an empty Cloud-Init CDROM drive after the virtual
      machine has been converted to a template. Defaults to false.

    cloud_init_storage_pool (string) - Name of the Proxmox storage pool to store the
      Cloud-Init CDROM on. If not given, the storage pool of the boot device will be used.

    qemu_additional_args (string) - Arbitrary arguments passed to KVM. For example -no-reboot
      -smbios type=0,vendor=FOO. Note: this option is for experts only.
  */
  cloud_init = true
  cloud_init_storage_pool = "Servers"
  // qemu_additional_args =

  /*
    ### Template Settings
  */
  // template_name = var.TEMPLATE_NAME
  // template_description = var.TEMPLATE_DESCRIPTION
  ssh_username = "remove"
  ssh_password = "password"
  ssh_timeout = "20m"
}

