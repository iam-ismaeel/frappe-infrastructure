resource "helm_release" "cert_manager" {
    name = "cert-manager"

    repository = "https://charts.jetstack.io"
    chart      = "cert-manager"
    namespace  = "controller"
    create_namespace = true
    version    = "v1.14.5"

    set {
        name = "installCRDs"     #uses custom resource to automatially obtain and renew certificates.
        value = "true"
    }  

    
 #depends_on = [helm_release.external_nginx]     #you can as well use aws_eks_node_group.general to deploy multiple helm charts in parallel
 }
 
















