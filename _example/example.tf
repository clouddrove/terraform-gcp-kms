provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}

module "kms_key" {

  source = "../"

  name        = "prod"
  environment = var.environment
  label_order = var.label_order

  google_kms_key_ring_enabled               = true
  google_kms_crypto_key_enabled             = true
  google_kms_crypto_key_iam_binding_enabled = true
  project_id                                = var.gcp_project_id
  location                                  = var.location
  keys                                      = ["dev"]
  prevent_destroy                           = false
  service_accounts                          = ["serviceAccount:service-xxxxxxxxxxxxxxx.gserviceaccount.com"]
  role                                      = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
}
