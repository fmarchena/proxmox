variable "pm_api_url" {
  type = string
}

variable "pm_api_token_id" {
  type = string
}

variable "pm_api_token_secret" {
  type = string
}

variable "pm_tls_insecure" {
  type    = bool
  default = true
}

variable "target_node" {
  type = string
}

variable "vm_name" {
  type    = string
  default = "puppy-bookworm-installer"
}

variable "cores" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 2048
}

variable "disk_storage" {
  type    = string
  default = "local-lvm"
}

variable "disk_size_gb" {
  type    = number
  default = 20
}

variable "net_bridge" {
  type    = string
  default = "vmbr0"
}

variable "iso_storage" {
  type    = string
  default = "local"
}

variable "iso_file" {
  type    = string
  default = "BookwormPup64_10.0.10.iso"
}
