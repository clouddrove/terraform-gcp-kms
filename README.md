<!-- This file was automatically generated by the `geine`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->

<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform gcp kms
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    This terraform module creates a KMS Customer Master Key (CMK).
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.1.7-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>
<a href="https://github.com/clouddrove/terraform-gcp-kms/actions/workflows/tfsec.yml">
  <img src="https://github.com/clouddrove/terraform-gcp-kms/actions/workflows/tfsec.yml/badge.svg" alt="tfsec">
</a>
<a href="https://github.com/clouddrove/terraform-gcp-kms/actions/workflows/terraform.yml">
  <img src="https://github.com/clouddrove/terraform-gcp-kms/actions/workflows/terraform.yml/badge.svg" alt="static-checks">
</a>


</p>
<p align="center">

<a href='https://facebook.com/sharer/sharer.php?u=https://github.com/clouddrove/terraform-gcp-kms'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/shareArticle?mini=true&title=Terraform+gcp+kms&url=https://github.com/clouddrove/terraform-gcp-kms'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>
<a href='https://twitter.com/intent/tweet/?text=Terraform+gcp+kms&url=https://github.com/clouddrove/terraform-gcp-kms'>
  <img title="Share on Twitter" src="https://user-images.githubusercontent.com/50652676/62817740-4c69db00-bb59-11e9-8a79-3580fbbf6d5c.png" />
</a>

</p>
<hr>


We eat, drink, sleep and most importantly love **DevOps**. We are working towards strategies for standardizing architecture while ensuring security for the infrastructure. We are strong believer of the philosophy <b>Bigger problems are always solved by breaking them into smaller manageable problems</b>. Resonating with microservices architecture, it is considered best-practice to run database, cluster, storage in smaller <b>connected yet manageable pieces</b> within the infrastructure. 

This module is basically combination of [Terraform open source](https://www.terraform.io/) and includes automatation tests and examples. It also helps to create and improve your infrastructure with minimalistic code instead of maintaining the whole infrastructure code yourself.

We have [*fifty plus terraform modules*][terraform_modules]. A few of them are comepleted and are available for open source usage while a few others are in progress.




## Prerequisites

This module has a few dependencies: 

- [Terraform 1.x.x](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [Go](https://golang.org/doc/install)
- [github.com/stretchr/testify/assert](https://github.com/stretchr/testify)
- [github.com/gruntwork-io/terratest/modules/terraform](https://github.com/gruntwork-io/terratest)



## Examples


**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/clouddrove/terraform-gcp-kms/releases).


Here are some examples of how you can use this module in your inventory structure:
### Default subnet
```hcl
module "kms_key" {

source = "clouddrove/kms/google"
version     = "1.0.0"

name        = "prod"
environment = var.environment
label_order = var.label_order

google_kms_key_ring_enabled               = true
google_kms_crypto_key_enabled             = true    # when prevent_destroy required true use this key (long-lived key)
google_kms_crypto_key_ephemeral_enabled   = false   # when prevent_destroy required false use this key (short-lived key)
google_kms_crypto_key_iam_binding_enabled = true
project_id                                = var.gcp_project_id
location                                  = var.location
keys                                      = ["dev"]
service_accounts                          = ["serviceAccount:service-xxxxxxxxxxxxxxx.gserviceaccount.com"]
role                                      = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Environment name | `string` | `"dev"` | no |
| google\_kms\_crypto\_key\_enabled | create an ephemeral Google Cloud KMS crypto key within the module. Set to true to include it. | `bool` | `true` | no |
| google\_kms\_crypto\_key\_ephemeral\_enabled | create an ephemeral Google Cloud KMS crypto key within the module. Set to false to exclude it." | `bool` | `true` | no |
| google\_kms\_crypto\_key\_iam\_binding\_enabled | (Optional) Whether or not to create resources within the module. | `bool` | `true` | no |
| google\_kms\_key\_ring\_enabled | (Optional) Whether or not to create resources within the module. | `bool` | `true` | no |
| key\_algorithm | The algorithm to use when creating a version based on this template. See the https://cloud.google.com/kms/docs/reference/rest/v1/CryptoKeyVersionAlgorithm for possible inputs. | `string` | `"GOOGLE_SYMMETRIC_ENCRYPTION"` | no |
| key\_protection\_level | The protection level to use when creating a version based on this template. Default value: "SOFTWARE" Possible values: ["SOFTWARE", "HSM"] | `string` | `"SOFTWARE"` | no |
| key\_rotation\_period | n/a | `string` | `"100000s"` | no |
| keyring | Keyring name. | `string` | `""` | no |
| keys | Key names. | `list(string)` | `[]` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| location | Location for the keyring. | `string` | `""` | no |
| module\_enabled | (Optional) Whether or not to create resources within the module. | `bool` | `true` | no |
| name | (Optional) The name of the VPC. The name will be used to prefix all associacted resources also. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression "[a-z]([-a-z0-9]\*[a-z0-9])?" which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. Default is "main". | `string` | `""` | no |
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




## Testing
In this module testing is performed with [terratest](https://github.com/gruntwork-io/terratest) and it creates a small piece of infrastructure, matches the output like ARN, ID and Tags name etc and destroy infrastructure in your AWS account. This testing is written in GO, so you need a [GO environment](https://golang.org/doc/install) in your system. 

You need to run the following command in the testing folder:
```hcl
  go test -run Test
```



## Feedback 
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/clouddrove/terraform-gcp-kms/issues), or feel free to drop us an email at [hello@clouddrove.com](mailto:hello@clouddrove.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/clouddrove/terraform-gcp-kms)!

## About us

At [CloudDrove][website], we offer expert guidance, implementation support and services to help organisations accelerate their journey to the cloud. Our services include docker and container orchestration, cloud migration and adoption, infrastructure automation, application modernisation and remediation, and performance engineering.

<p align="center">We are <b> The Cloud Experts!</b></p>
<hr />
<p align="center">We ❤️  <a href="https://github.com/clouddrove">Open Source</a> and you can check out <a href="https://github.com/clouddrove">our other modules</a> to get help with your new Cloud ideas.</p>

  [website]: https://clouddrove.com
  [github]: https://github.com/clouddrove
  [linkedin]: https://cpco.io/linkedin
  [twitter]: https://twitter.com/clouddrove/
  [email]: https://clouddrove.com/contact-us.html
  [terraform_modules]: https://github.com/clouddrove?utf8=%E2%9C%93&q=terraform-&type=&language=
