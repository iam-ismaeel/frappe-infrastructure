resource "helm_release" "external_nginx" {
    name = "external-nginx"

    repository  = "https://kubernetes.github.io/ingress-nginx"
    chart       = "ingress-nginx" 
    namespace    = "controller"
    create_namespace = true
    version     = "4.10.1"


    set {
    name  = "controller.image.tag"
    value = "v1.12.1"  # NGINX Ingress controller version (app version)
  }
    values = [file("${path.module}/values/nginx-ingress.yaml")]
    #depends_on = [helm_release.aws_lbc] # helm_release.aws_lbc ensures that the aws lbc is installed and running in the cluster
}

