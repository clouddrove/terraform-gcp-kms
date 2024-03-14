
##----------------------------------------------------------------------------- 
## KMS key module call.   
##-----------------------------------------------------------------------------

module "kms_key" {

  source = "../../"

  environment = var.environment
  label_order = var.label_order

  google_kms_crypto_key_iam_binding_enabled = true
  project_id                                = var.gcp_project_id
  prevent_destroy                           = false
  keyring                                   = "test-keyring"
  location                                  = var.location
  keys                                      = ["KMS1"]
  service_accounts                          = ["serviceAccount:example@project-id.iam.gserviceaccount.com"]
  role                                      = "roles/cloudkms.cryptoKeyEncrypterDecrypter" # add required roles here
}
