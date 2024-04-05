## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Environment name | `string` | `"dev"` | no |
| google\_kms\_crypto\_key\_iam\_binding\_enabled | (Optional) Whether or not to create IAM bindings for the Google Cloud KMS crypto key within the module. Set to true to include IAM bindings, false to exclude them. | `bool` | `true` | no |
| key\_algorithm | The algorithm to use when creating a version based on this template. See the https://cloud.google.com/kms/docs/reference/rest/v1/CryptoKeyVersionAlgorithm for possible inputs. | `string` | `"GOOGLE_SYMMETRIC_ENCRYPTION"` | no |
| key\_protection\_level | The protection level to use when creating a version based on this template. Default value: "SOFTWARE" Possible values: ["SOFTWARE", "HSM"] | `string` | `"SOFTWARE"` | no |
| key\_rotation\_period | specifies the duration, expressed in seconds, for the automatic rotation of cryptographic keys | `string` | `null` | no |
| keyring | Keyring name. | `string` | n/a | yes |
| keys | Key names. | `list(string)` | <pre>[<br>  "KMS-KEY"<br>]</pre> | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| location | Location for the keyring. | `string` | `""` | no |
| module\_enabled | (Optional) Whether or not to create resources within the module. | `bool` | `true` | no |
| prevent\_destroy | Set the prevent\_destroy lifecycle attribute on keys. | `bool` | `true` | no |
| project\_id | (Optional) The ID of the project in which the resource belongs. If it is not set, the provider project is used. | `string` | `null` | no |
| purpose | The immutable purpose of the CryptoKey. Possible values are ENCRYPT\_DECRYPT, ASYMMETRIC\_SIGN, and ASYMMETRIC\_DECRYPT. | `string` | `"ENCRYPT_DECRYPT"` | no |
| role | this role use for permissions | `string` | `"roles/cloudkms.cryptoKeyEncrypterDecrypter"` | no |
| service\_accounts | List of comma-separated owners for each key declared in set\_owners\_for. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| key | n/a |
| keyring | Self link of the keyring. |
| keyring\_name | Name of the keyring. |
| keyring\_resource | Keyring resource. |

