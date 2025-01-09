resource "kubernetes_namespace" "kratix-platform-system" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "kratix" {
  depends_on = [kubernetes_namespace.kratix-platform-system]
  name       = "kratix"
  chart      = "kratix"
  timeout    = 600
  version    = var.chart_version
  namespace  = var.namespace
  repository = "${var.charts_path}/kratix/"
  values = [
    templatefile("${path.module}/helm/values/values.yaml", {
      hostname                  = var.kratix_config.hostname
      slack_token               = var.kratix_config.slack_notification_token
      autoscaling_enabled       = var.kratix_config.autoscaling_enabled
      ingress_class_name        = var.kratix_config.ingress_class_name

    }),
    var.kratix_config.values_yaml
  ]
}

data "kubernetes_secret" "kratix-secret" {
  depends_on = [helm_release.kratix]
  metadata {
    name      = "kratix-initial-admin-secret"
    namespace = var.namespace
  }
}
