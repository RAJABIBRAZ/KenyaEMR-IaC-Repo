resource "kubernetes_namespace" "hub" {
  metadata {
    name = "hub"
  }

  lifecycle {
    ignore_changes = [metadata]
  }
}

resource "helm_release" "hub_landing" {
  name             = "hub"
  namespace        = kubernetes_namespace.hub.metadata[0].name
  chart            = var.chart_path
  version          = "0.1.0"
  create_namespace = true

  values = [
    file("${path.module}/../../charts/kenyaemr-hub/values.yaml")
  ]

  set = [
    {
      name  = "deployment.forceRedeployTimestamp"
      value = timestamp()
    }
  ]
}
