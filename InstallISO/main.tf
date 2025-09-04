resource "proxmox_virtual_environment_vm" "puppy" {
  name      = var.vm_name
  node_name = var.target_node
  on_boot   = false
  bios      = "seabios"

 
  cpu {
    cores = var.cores
    type  = "host"
  }

  memory {
    dedicated = var.memory
  }

  scsi_hardware = "virtio-scsi-pci"

  # Disco principal (destino de la instalación)
  disk {
    datastore_id = var.disk_storage   # ej. local-lvm
    interface    = "scsi0"
    size         = var.disk_size_gb   # número en GB, p.ej. 20
    ssd          = true
    discard      = "on"
    cache        = "writeback"
    iothread     = true
  }

  # Red
  network_device {
    bridge = var.net_bridge           # vmbr0/vmbr1
    model  = "virtio"
  }

  # CDROM con ISO existente en el storage
  cdrom {
    enabled   = true
    interface = "ide2"
    file_id   = "${var.iso_storage}:iso/${var.iso_file}"
  }

  # Orden de arranque: primero ISO, luego el disco
  boot_order = ["ide2", "scsi0"]

  lifecycle {
    ignore_changes = [cdrom, boot_order]
  }
}
