variable "ISO_STORAGE_POOL"{
    type = string
}
variable "SSH_USERNAME"{
    type = string
}
variable "SSH_PASSWORD" {
    type = string
    sensitive = true
}
variable "PACKER_LOG"{
    type = number
}
variable "PM_TLS_INSECURE"{
    type = bool
}
variable "PM_API_URL"{
    type = string
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