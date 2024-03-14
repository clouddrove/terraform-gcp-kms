#---------------------------- Label modules variables --------------------------------------

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

#---------------------------- KMS module variables --------------------------------------
variable "project_id" {
  type        = string
  default     = null
  description = "(Optional) The ID of the project in which the resource belongs. If it is not set, the provider project is used."
}

variable "location" {
  type        = string
  default     = ""
  description = "Location for the keyring."
}

variable "prevent_destroy" {
  description = "Set the prevent_destroy lifecycle attribute on keys."
  type        = bool
  default     = true
}

variable "keyring" {
  description = "Keyring name."
  type        = string
}

variable "keys" {
  type        = list(string)
  default     = ["KMS-KEY"]
  description = "Key names."
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

variable "google_kms_crypto_key_iam_binding_enabled" {
  type        = bool
  default     = true
  description = "(Optional) Whether or not to create IAM bindings for the Google Cloud KMS crypto key within the module. Set to true to include IAM bindings, false to exclude them."
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
  type        = string
  default     = null
  description = "specifies the duration, expressed in seconds, for the automatic rotation of cryptographic keys"
}



