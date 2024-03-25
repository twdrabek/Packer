source "proxmox-iso" "kali-rolling-lab" {
  /*
    # Web Application Hacking Lab
    ## Kali Linux Packer Builder
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
  pool = "Lab_Kali"
  vm_name = "kali-template-packer"
  vm_id = 200
  tags = "student;lab;kali;attack;disposable"
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
  disks {
    type = "scsi"
    disk_size = "32G"
    storage_pool = "Mass"
    format = "qcow2"
  }

  /*
    ### CPU Settings
  */
  sockets = 2
  cores = 2
  cpu_type = "x86-64-v2-AES"

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
    boot_wait = "10s"
    boot_command = [
        "<esc><wait>",
        "/install.amd/vmlinuz<wait>",
        " auto<wait>",
        " console-setup/ask_detect=false<wait>",
        " console-setup/layoutcode=us<wait>",
        " console-setup/modelcode=pc105<wait>",
        " debconf/frontend=noninteractive<wait>",
        " debian-installer=en_US<wait>",
        " fb=false<wait>",
        " initrd=/install.amd/initrd.gz<wait>",
        " kbd-chooser/method=us<wait>",
        " netcfg/choose_interface=eth0<wait>",
        " console-keymaps-at/keymap=us<wait>",
        " keyboard-configuration/xkb-keymap=us<wait>",
        " keyboard-configuration/layout=USA<wait>",
        " keyboard-configuration/variant=USA<wait>",
        " locale=en_US<wait>",
        // " netcfg/get_domain=vm<wait>",
        // " netcfg/get_hostname={{.Name}}<wait>",
        " grub-installer/bootdev=/dev/sda<wait>",
        " noapic<wait>",
        " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/kali-preseed.cfg auto=true priority=critical",
        " -- <wait>",
        "<enter><wait>"
    ]
    // boot = "ncd"

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
  cloud_init_storage_pool = "Lab_Kali"
  // qemu_additional_args =

  /*
    ### Template Settings
  */
  template_name = "Kali-Rolling-Lab"
  template_description = "Kali Rolling for the Web Application Hacking Lab."
  ssh_username = "${var.SSH_USERNAME}"
  ssh_password = "${var.SSH_PASSWORD}"
  ssh_timeout = "20m"
}

