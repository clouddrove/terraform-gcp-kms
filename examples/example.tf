provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}

module "kms_key" {

  source = "../"

  name        = "kms-test1"
  environment = var.environment
  label_order = var.label_order

  google_kms_key_ring_enabled               = true
  google_kms_crypto_key_enabled             = true
  google_kms_crypto_key_ephemeral_enabled   = false
  google_kms_crypto_key_iam_binding_enabled = true
  project_id                                = var.gcp_project_id
  location                                  = var.location
  keys                                      = ["cloud_kms-key"]
  prevent_destroy                           = true
  service_accounts                          = ["serviceAccount:general-use@dev-env-3b53.iam.gserviceaccount.com"]
  role                                      = "roles/cloudkms.cryptoKeyEncrypterDecrypter" # add required roles here
}
