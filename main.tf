module "labels" {
  source = "git::https://github.com/clouddrove/terraform-gcp-labels.git?ref"

  name        = var.name
  environment = var.environment
  label_order = var.label_order
}

resource "google_kms_key_ring" "key_ring" {
  count = var.google_kms_key_ring_enabled && var.module_enabled ? 1 : 0

  name     = module.labels.id
  project  = var.project_id
  location = var.location
}

resource "google_kms_crypto_key" "key" {
  count = var.google_kms_crypto_key_enabled && var.module_enabled ? 1 : 0

  name            = module.labels.id
  key_ring        = join("", google_kms_key_ring.key_ring.*.id)
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

resource "google_kms_crypto_key" "key_ephemeral" {
  count = var.google_kms_crypto_key_enabled && var.module_enabled ? 1 : 0

  name            = module.labels.id
  key_ring        = join("", google_kms_key_ring.key_ring.*.id)
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

resource "google_kms_crypto_key_iam_binding" "owners" {
  count = var.google_kms_crypto_key_iam_binding_enabled && var.module_enabled ? 1 : 0

  role          = var.role
  crypto_key_id = join("", google_kms_crypto_key.key.*.id)
  members       = compact(split(",", var.service_accounts[count.index]))
}