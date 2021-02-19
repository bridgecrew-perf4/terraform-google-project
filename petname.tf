resource "random_pet" "project" {
  length    = 2
  separator = "-"

  keepers = {
    project_id_prefix = var.project_id_prefix
  }
}
