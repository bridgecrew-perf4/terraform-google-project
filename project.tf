resource "google_project" "project" {
  billing_account = data.google_billing_account.billing_account.id
  folder_id       = data.google_folder.folder.id

  name       = var.project_name
  project_id = "${var.project_id_prefix}-${random_pet.project.id}"

  auto_create_network = false

  labels = local.labels

  depends_on = [random_pet.project]
}

resource "google_project_default_service_accounts" "project" {
  count = var.disable_default_service_accounts ? 1 : 0

  project        = google_project.project.id
  action         = "DISABLE"
  restore_policy = "REVERT"

  depends_on = [google_project.project]
}

output "project_id" {
  value = google_project.project.id
}
