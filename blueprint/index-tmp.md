---
title: AWS EventBridge - Write analytics detail events to S3
author: ronan.watkins
indextype: blueprint
icon: blueprint
image: images/arch-eventbridge-s3.png
category: 6
summary: |
  This Genesys Cloud Developer Blueprint provides an example of a complete terraform configuration that creates a Genesys Cloud EventBridge integration and writes events from the integration into S3.
---

![Write analytics detail events to S3](images/arch-eventbridge-s3.png "AWS EventBridge diagram  - Write analytics detail events to S3 blueprint")

* [Solution components](#solution-components "Goes to the Solutions components section")
* [Prerequisites](#prerequisites "Goes to the Prerequisites section")
* [Implementation steps](#implementation-steps "Goes to the Implementation steps section")
* [Additional resources](#additional-resources "Goes to the Additional resources section")

## Solution components

* **[Genesys Cloud](https://www.genesys.com/genesys-cloud "Opens the Genesys Cloud website")** - A suite of Genesys Cloud services for enterprise-grade communications, collaboration, and contact center management.
* **[Terraform](https://www.terraform.io/ "Opens the Terraform website")** - An open-source infrastructure as code software tool that provides a consistent CLI workflow to manage hundreds of cloud services. Terraform codifies cloud APIs into declarative configuration files.
* **[CX as Code](https://developer.genesys.cloud/api/rest/CX-as-Code/ "Opens the CX as Code page on the Developer Center")** - A tool to declaratively manage Genesys Cloud resources and configuration across organizations using Terraform.
* **[AWS Terraform Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs "Opens the AWS Terraform Provider")** - Life cycle management of AWS resources, including EC2, Lambda, EKS, ECS, VPC, S3, RDS, DynamoDB, and more.
* **[Amazon EventBridge](https://aws.amazon.com/eventbridge/ "Opens the Amazon EventBridge website")** - A scalable, serverless event bus that streams real-time data to selected targets based on custom routing rules.

## Prerequisites

### Specialized knowledge

* AWS Cloud Practitioner-level knowledge of AWS IAM, AWS EventBridge, AWS Kinesis and AWS S3
* Familiarity with Terraform or similar Infrastructure as Code tools

### Genesys Cloud account

* A Genesys Cloud license. For more information, see [Genesys Cloud pricing](https://www.genesys.com/pricing "Opens the Genesys Cloud pricing page") on the Genesys website.

### AWS user account  
* An administrator account with permissions to access the following services:
  * AWS Identity and Access Management (IAM)
  * AWS Lambda
* AWS credentials. For more information about setting up your AWS credentials on your local machine, see [The shared config and credentials files](https://docs.aws.amazon.com/sdkref/latest/guide/creds-config-files.html "Opens The shared config and credentials files on the About credential providers page") in AWS documentation.

### Third-party software

* Terraform version 1.0.0 or later. For more information, see [Download terraform](https://www.terraform.io/downloads "Opens Download the latest version of Terraform") on the Terraform website.

## Implementation steps

* [Clone the repository that contains the project files](#clone-the-repository-that-contains-the-project-files "Goes to the Clone the repository that contains the project files section")
* [Set up your AWS and Genesys Cloud Credentials](#setup-your-aws-and-genesys-cloud-credentials "Goes to the Setup your AWS and Genesys Cloud Credentials section")
* [Edit the configuration files](#edit-the-configuration-files  "Goes to the Edit the configuration files section")
* [Deploy the application](#deploy-the-application "Goes to the Deploy the application section")
* [Initiate a conversation](#initiate-a-conversation "Goes to the Initiate a conversation section")
* [View S3 bucket contents](#view-s3-bucket-contents "Goes to the View S3 bucket contents section")
* [Next steps](#next-steps "Goes to the Next steps section")

### Clone the repository that contains the project files

Clone the [aws-eventbridge-analytics-detail-events-blueprint](https://github.com/GenesysCloudBlueprints/aws-eventbridge-analytics-detail-events-blueprint "Opens the aws-eventbridge-analytics-detail-events-blueprint") repository in GitHub.

### Set up your AWS and Genesys Cloud Credentials

To run this project using the AWS and Genesys Cloud Terraform provider you must open a terminal window, set the following environment variables and then run Terraform in the window where the following environment variables are set:

* `GENESYSCLOUD_OAUTHCLIENT_ID` - This is the Genesys Cloud client credential grant Id that CX as Code executes against. 
* `GENESYSCLOUD_OAUTHCLIENT_SECRET` - This is the Genesys Cloud client credential secret that CX as Code executes against. 
* `GENESYSCLOUD_REGION` - This is the Genesys Cloud region in which your organization is located.
* `AWS_ACCESS_KEY_ID` - You must setup the AWS Access Key in your Amazon account to allow the AWS Terraform provider to act against your account.
* `AWS_SECRET_ACCESS_KEY` - This the AWS Secret you must setup in your Amazon account to allow the AWS Terraform provider to act against your account.

**Note:** For the purposes of this project the Genesys Cloud OAuth Client was given the master admin role. 

### Edit the configuration files

1. In your local copy of the [aws-eventbridge-analytics-detail-events-blueprint](https://github.com/GenesysCloudBlueprints/aws-eventbridge-analytics-detail-events-blueprint "Opens the aws-eventbridge-analytics-detail-events-blueprint repository in GitHub") repository, edit `blueprint/terraform/terraform.tfvars` and provide your AWS account region in `aws_account_region`. Feel free to edit other variables if you want.

### Deploy the application

1. From the repo root, run the following command to initialize the terraform providers:

```
terraform init
```

2. Run the following command to deploy the application. Enter 'yes' when prompted to apply the changeset:

```
terraform apply
```

### Initiate a conversation

There are several ways to initiate a conversation to generate the detail events for this integration. The most straightforward is more than likely to follow the [Web Chat Dev Tool Guide](https://developer.genesys.cloud/guides/quickstarts/developer-tools-web-chats) to use the [Web Chat Dev Tool](https://developer.genesys.cloud/developer-tools/#/webchat).  
If following the guide, note that step 6 is not necessary to start a web chat.

### View S3 bucket contents

The buffering interval has been set to 60 seconds, which is the lowest possible value. For this reason, it takes at least 60 seconds for the subscribed conversation detail events to be written to the bucket, sometimes this takes a few minutes.

After 60 seconds has elapsed from initiating the conversation, view the bucket contents in the AWS console. The bucket name is `conversation-detail-events-bucket` if `s3_bucket_name` in `blueprint/terraform/terraform.tfvars` has not been changed. The events are stored in a file under `conversation-detail-events/YYYY/MM/DD/HH/`.

### Next steps

The purpose of this blueprint was to provide terraform configuration for creating a Genesys Cloud Event Bridge Integration and corresponding AWS infrastructure to write events from the integration into S3. This solution can be extended to use Athena to analyze the data in S3, or the S3 destination could be replaced with OpenSearch to make use of the many features it provides for text-search, analytics, business intelligence and so on. 

## Additional resources

* [Terraform introduction](https://www.terraform.io/intro "Opens the Terraform introduction")
* [AWS Athena introduction](https://docs.aws.amazon.com/athena/latest/ug/what-is.html "Opens the AWS Athena introduction")
* [AWS OpenSearch introduction](https://aws.amazon.com/opensearch-service/the-elk-stack/what-is-opensearch/ "Opens the AWS OpenSearch introduction")
* [AWS EventBridge user guide](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-what-is.html "Opens the AWS EventBridge user guide")
* The [aws-eventbridge-analytics-detail-events-blueprint](https://github.com/GenesysCloudBlueprints/aws-eventbridge-analytics-detail-events-blueprint "Opens the aws-eventbridge-analytics-detail-events-blueprint repository in GitHub") repository in GitHub