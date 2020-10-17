# Output the SSH private key for the VM
output "tls_private_key" {
  value = "${tls_private_key.ssh.private_key_pem}"
}

# Output the public IP address of the VM
output "public_ip_address" {
  value = azurerm_public_ip.test_vm.*.ip_address
}