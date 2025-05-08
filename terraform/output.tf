
output "cloud_run_url" {
  value = google_cloud_run_service.flutter_web.status[0].url
}
