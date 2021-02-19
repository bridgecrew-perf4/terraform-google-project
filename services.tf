resource "google_project_service" "service" {
  for_each = toset(var.enabled_apis)

  project = google_project.project.id
  service = each.key

  disable_dependent_services = false
  disable_on_destroy         = true

  depends_on = [google_project.project]
}
