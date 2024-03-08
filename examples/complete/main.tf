
##----------------------------------------------------------------------------- 
## KMS key module call.   
##-----------------------------------------------------------------------------

module "kms_key" {

  source = "../../"

  environment = "dev"
  label_order = var.label_order

  google_kms_crypto_key_iam_binding_enabled = true
  project_id                                = var.gcp_project_id
  prevent_destroy                           = true
  key_rotation_period                       = "100000s"
  keyring                                   = "test-keyring"
  location                                  = var.location
  keys                                      = ["KMS1", "KMS2"]
  service_accounts                          = ["serviceAccount:example@project-id.iam.gserviceaccount.com"]
  role                                      = "roles/cloudkms.cryptoKeyEncrypterDecrypter" # add required roles here
}
