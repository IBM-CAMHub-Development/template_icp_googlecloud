###
output "ibm_cloud_private_admin_url" {
  value = "https://${google_compute_address.icp-master.address}:8443"
}

output "ICP Registry URL" {
  value = "https://${google_compute_address.icp-master.address}:8500"
}

output "ICP Kubernetes API URL" {
  value = "https://${google_compute_address.icp-master.address}:8001"
}

output "ibm_cloud_private_cluster_name" {
  value = "${var.deployment}"
}

output "ibm_cloud_private_admin_user" {
  value = "admin"
}

output "ibm_cloud_private_admin_password" {
  value = "${local.icppassword}"
}

output "ibm_cloud_private_boot_ip" {
  value = "${google_compute_instance.icp-boot.network_interface.0.access_config.0.assigned_nat_ip}"
}

output "ibm_cloud_private_master_ip" {
  value = "${var.deployment}.icp"
}

output "ibm_cloud_private_proxy_ip" {
  value = "${google_compute_address.icp-proxy.address}"
}

output "ibm_cloud_private_ssh_user" {
  value = "${var.ssh_user}"
}

output "ibm_cloud_private_ssh_key" {
  value = "${base64encode(tls_private_key.installkey.private_key_pem)}"
}

output "Filestore for registry and audit" {
  value = "${var.master["nodes"] > 1 ? "${google_filestore_instance.icp-registry.networks.0.ip_addresses.0}:/${google_filestore_instance.icp-registry.file_shares.0.name}":"" }"
}