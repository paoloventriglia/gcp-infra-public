variable "name" {
  type = "list"
  default = []
  description = ""
}

variable "org" {
  default = ""
  description = ""
}

variable "env" {
  default = "dev"
  description = ""
}

variable "project_id" {
  default = "your-project-id"
  description = ""
}

variable "operations" {
  default = "false"
  description = ""
}

resource "tfe_workspace" "workspace" {
  count        = length(var.name)
  name         = "${var.env}-${var.project_id}-gcp-infra-${var.name[count.index]}"
  organization = var.org
  operations   = var.operations
}