variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment name"
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. `name`,`application`."
}

variable "project_id" {
  type        = string
  default     = null
  description = "(Optional) The ID of the project in which the resource belongs. If it is not set, the provider project is used."
}

variable "name" {
  type        = string
  default     = ""
  description = "(Optional) The name of the VPC. The name will be used to prefix all associacted resources also. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression \"[a-z]([-a-z0-9]*[a-z0-9])?\" which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. Default is \"main\"."

}

variable "location" {
  type        = string
  default     = ""
  description = "Location for the keyring."
}

variable "keyring" {
  type        = string
  default     = ""
  description = "Keyring name."
}

variable "keys" {
  type        = list(string)
  default     = []
  description = "Key names."
}

variable "prevent_destroy" {
  type        = bool
  default     = true
  description = "Set the prevent_destroy lifecycle attribute on keys."
}

variable "purpose" {
  type        = string
  default     = "ENCRYPT_DECRYPT"
  description = "The immutable purpose of the CryptoKey. Possible values are ENCRYPT_DECRYPT, ASYMMETRIC_SIGN, and ASYMMETRIC_DECRYPT."
}

variable "role" {
  type        = string
  default     = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  description = "this role use for permissions"
}

variable "module_enabled" {
  type        = bool
  default     = true
  description = "(Optional) Whether or not to create resources within the module."
}

variable "google_kms_key_ring_enabled" {
  type        = bool
  default     = true
  description = "(Optional) Whether or not to create resources within the module."
}

variable "google_kms_crypto_key_enabled" {
  type        = bool
  default     = true
  description = "(Optional) Whether or not to create resources within the module."
}

variable "google_kms_crypto_key_iam_binding_enabled" {
  type        = bool
  default     = true
  description = "(Optional) Whether or not to create resources within the module."
}

variable "service_accounts" {
  type        = list(string)
  default     = []
  description = "List of comma-separated owners for each key declared in set_owners_for."
}

variable "key_algorithm" {
  type        = string
  default     = "GOOGLE_SYMMETRIC_ENCRYPTION"
  description = "The algorithm to use when creating a version based on this template. See the https://cloud.google.com/kms/docs/reference/rest/v1/CryptoKeyVersionAlgorithm for possible inputs."
}

variable "key_protection_level" {
  type        = string
  default     = "SOFTWARE"
  description = "The protection level to use when creating a version based on this template. Default value: \"SOFTWARE\" Possible values: [\"SOFTWARE\", \"HSM\"]"
}

variable "key_rotation_period" {
  type    = string
  default = "100000s"
}
