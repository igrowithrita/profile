variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "container_image" {
  description = "Container image URI"
  type        = string
}

variable "domain_name" {
  description = "Custom domain name"
  type        = string
}