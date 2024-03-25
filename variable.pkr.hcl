variable "ISO_STORAGE_POOL"{
    type = string
    description = "Proxmox storage pool onto which to upload the ISO file."
    default = "Mass"
}
variable "ISO_FILE"{
    type = string
    description = "The ISO file."
}
variable "SSH_USERNAME"{
    type = string
    description = "Username for SSH to VM."
    default = "root"
}
// variable "SSH_PASSWORD" {
//     type = string
//     sensitive = true
// }
variable "PACKER_LOG"{
    type = number
}
variable "PM_TLS_INSECURE"{
    type = bool
    description = "Skip TLS verification. (Allow self-signed certificates)"
}
variable "PM_API_URL"{
    type = string
    default = "https://10.10.0.2:8006/api2/json"
}
variable "PM_USER" {
    description = "(Optional) The user, remember to include the authentication realm such as myuser@pam or myuser@pve."
    type = string
}
variable "PM_PASSWORD" {
    description = "(Optional) The password."
    type = string
    sensitive = true
}