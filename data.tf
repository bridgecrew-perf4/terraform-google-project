data "google_billing_account" "billing_account" {
  billing_account = var.billing_account
  open            = true
}

data "google_folder" "folder" {
  folder              = "billingAccounts/${var.folder_id}"
  lookup_organization = true
}
