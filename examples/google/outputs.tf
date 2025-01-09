output "kratix" {
  description = "kratix_Info"
  value = {
    username = "admin",
    password = nonsensitive(data.kubernetes_secret.kratix_password.data["bootstrapPassword"]),
    url      = var.kratix_config.hostname
  }
}
