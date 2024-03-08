##-----------------------------------------------------------------------------
## Labels module callled that will be used for naming and tags.   
##-----------------------------------------------------------------------------

module "labels" {
  source  = "clouddrove/labels/gcp"
  version = "1.0.0"

  environment = var.environment
  label_order = var.label_order
}

locals {
  keys_by_name = zipmap(var.keys, var.prevent_destroy ? slice(google_kms_crypto_key.key[*].id, 0, length(var.keys)) : slice(google_kms_crypto_key.key_ephemeral[*].id, 0, length(var.keys)))
}

##----------------------------------------------------------------------------- 
## resource uses for create key-ring
##-----------------------------------------------------------------------------

resource "google_kms_key_ring" "key_ring" {
  name     = var.keyring
  project  = var.project_id
  location = var.location
}

##----------------------------------------------------------------------------- 
## prevent_destroy = true for long lived key not deleting using terraform 
##-----------------------------------------------------------------------------

resource "google_kms_crypto_key" "key" {
  count           = var.prevent_destroy ? length(var.keys) : 0
  name            = var.keys[count.index]
  key_ring        = google_kms_key_ring.key_ring.id
  rotation_period = var.key_rotation_period
  purpose         = var.purpose

  lifecycle {
    prevent_destroy = true
  }

  version_template {
    algorithm        = var.key_algorithm
    protection_level = var.key_protection_level
  }

}

##----------------------------------------------------------------------------- 
## prevent_destroy = false for short lived key deleting using terraform 
##-----------------------------------------------------------------------------

resource "google_kms_crypto_key" "key_ephemeral" {
  count           = var.prevent_destroy ? 0 : length(var.keys)
  name            = var.keys[count.index]
  key_ring        = google_kms_key_ring.key_ring.id
  rotation_period = var.key_rotation_period
  purpose         = var.purpose

  lifecycle {
    prevent_destroy = false
  }

  version_template {
    algorithm        = var.key_algorithm
    protection_level = var.key_protection_level
  }
}

##----------------------------------------------------------------------------- 
## resource uses for binding iam role to service-account  
##-----------------------------------------------------------------------------

resource "google_kms_crypto_key_iam_binding" "owners" {
  count = var.google_kms_crypto_key_iam_binding_enabled && var.module_enabled ? 1 : 0

  role          = var.role
  crypto_key_id = join("", google_kms_crypto_key.key[*].id)
  members       = compact(split(",", var.service_accounts[count.index]))
}
