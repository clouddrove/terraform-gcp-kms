variable "environment" {
  type        = string
  default     = "key"
  description = "Environment name"
}

variable "label_order" {
  type        = list(any)
  default     = ["environment", "name"]
  description = "Label order, e.g. `name`,`application`."
}

variable "gcp_project_id" {
  type        = string
  default     = "clouddrove"
  description = "Google Cloud project ID"
}

variable "gcp_region" {
  type        = string
  default     = "europe-west1"
  description = "Google Cloud region"
}

variable "gcp_zone" {
  type        = string
  default     = "Europe-west3-c"
  description = "Google Cloud zone"
}

variable "location" {
  type        = string
  default     = "europe-west3"
  description = "Location for the keyring."
}
