terraform-aws-common-iam-roles/datadog-integration
==================================================

This module is meant to create IAM Role for AWS-Datadog integration.

Usage
-----

You can open this example:
[Datadog Role](https://github.com/traveloka/terraform-aws-common-iam-roles/tree/master/examples/datadog-integration)


Important Notes
---------------

You need to:
1. go to https://app.datadoghq.com/account/settings#integrations/amazon_web_services and try to add an account, you will get an external ID (don't close the tab yet)
2. run this module using that external ID
3. use your AWS Account ID and the generated AWS Role name to add an account at https://app.datadoghq.com/account/settings#integrations/amazon_web_services (at the same tab that give you the exernal ID)
4. fill the *"Per namespace"* section by clicking button *"Add an account specific namespace rule"* and choose which *"Service"* you **really need** to collect
  because we will update the *"Preferences for all accounts"* section **by 1 August 2019** to **not collect any AWS metrics**

Also important:
- fill the *"Optionally limit metrics collection"* section if not all instances in your AWS account need to get the metrics and EC2 tags streamed *from AWS*
  additional info: most (if not all) of necessary AWS EC2 metrics are already covered by Datadog agent


Terraform Version
-----------------

This module was created using Terraform 0.11.4.
So to be more safe, Terraform version 0.11.4 or newer is required to use this module.


Authors
-------

* [Ronny Kaluge](https://github.com/ronny-kaluge)

License
-------

Apache 2 Licensed. See LICENSE for full details.
