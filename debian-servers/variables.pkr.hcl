variable "PM_API_TOKEN_ID" {
    type = string
    sensitive = true
}
variable "PM_API_TOKEN_SECRET" {
    type = string
    sensitive = true
}
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
variable "SSH_PASSWORD" {
    type = string
    sensitive = true
}
variable "PACKER_LOG"{
    type = string
    description = "Setting this to any value other than \"\" (empty string) or \"0\" will enable the logger"
    default = "0"
}
variable "PM_TLS_INSECURE"{
    type = bool
    description = "Skip TLS verification. (Allow self-signed certificates)"
}
variable "PM_API_URL"{
    type = string
    default = "https://10.10.0.2:8006/api2/json"
}
// variable "VM_NAME" {
//     type = string
//     description = "Name of the virtual machine during creation. If not given, a random uuid will be used."
// }
// variable "DISK_SIZE" {
//     type = string
// }
// variable "VM_ID" {
//     type = number
// }
// variable "TEMPLATE_NAME" {
//     type = string
// }
// variable "TEMPLATE_DESCRIPTION" {
//     type = string
// }
// variable "PM_USER" {
//     description = "(Optional) The user, remember to include the authentication realm such as myuser@pam or myuser@pve."
//     type = string
// }
// variable "PM_PASSWORD" {
//     description = "(Optional) The password."
//     type = string
//     sensitive = true
// }