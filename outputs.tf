output "keyring" {
  value       = join("", google_kms_key_ring.key_ring.*.id)
  description = "Self link of the keyring."

}

output "keyring_resource" {
  value       = join("", google_kms_key_ring.key_ring.*.id)
  description = "Keyring resource."

}

output "keyring_name" {
  value       = join("", google_kms_key_ring.key_ring.*.name)
  description = "Name of the keyring."

}

output "key" {
  value = join("", google_kms_crypto_key.key.*.id)
}