# Google Cloud Project

Made for Terraform >0.14.x

### Code examples

#### Required arguments and variables

```hcl
module "project_example_slim" {
  source = "git::https://github.com/bulderbank/terraform-google-project.git?ref=v1.0.0"

  created_by = "fredrick-myrvoll"
  created_on = "2022-02-19"

  environment = var.environment

  billing_account = var.billing_account
  folder_id       = var.parent_folder_id

  project_name      = "whatever-friendly-name"
  project_id_prefix = "whatever-${var.environment}"
}
```

#### All arguments and variables enabled

```hcl
module "project_example_slim" {
  source = "git::https://github.com/bulderbank/terraform-google-project.git?ref=v1.0.0"

  created_by = "fredrick-myrvoll"
  created_on = "2022-02-19"

  environment = var.environment

  billing_account = var.billing_account
  folder_id       = var.parent_folder_id

  project_name      = "whatever-friendly-name"
  project_id_prefix = "whatever-${var.environment}"

  disable_default_service_accounts = false

  enabled_apis = [
    "bigquery.googleapis.com",
    "compute.googleapis.com",
    "iam.googleapis.com",
    "pubsub.googleapis.com"
  ]
}
```

#### Module Outputs

| Output | Description |
| --- | --- |
| project_id | Generated Project ID |