variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default = "igrowwithrita"
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "europe-west3"
}

variable "container_image" {
  description = "Container image URI"
  type        = string
  default     = "gcr.io/igrowwithrita/flutter-web:latest"
}

variable "domain_name" {
  description = "Custom domain name"
  type        = string
  default = "igrowwithrita"
}

variable "tf_bucket_name" {
  description = "GCS bucket name for Terraform state"
  type        = string
  default     = "igrowwithrita-tf-state"
  
}