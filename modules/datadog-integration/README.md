terraform-aws-common-iam-roles/datadog-integration
==================================================

This module is meant to create IAM Role for AWS-Datadog integration.

Usage
-----

You can open this example: 
[Datadog Integration](https://github.com/traveloka/terraform-aws-common-iam-roles/tree/master/examples/datadog-integration)

Important Notes
---------------

You need to:
1. Go to https://app.datadoghq.com/account/settings#integrations/amazon_web_services and try to add an account, you will get an external ID (don't close the tab yet)
2. Run this module using that external ID
3. Use the generated ARN to add an account at https://app.datadoghq.com/account/settings#integrations/amazon_web_services (at the same tab that give you the exernal ID)
the exact time limit to do all this is unknown but 5 minutes is enough.


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
