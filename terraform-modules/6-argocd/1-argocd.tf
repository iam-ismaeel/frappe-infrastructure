resource "helm_release" "argocd" {
    name = "argocd"

    repository             = "https://argoproj.github.io/argo-helm"
    chart                  = "argo-cd"
    namespace              = "argocd"
    create_namespace       = true
    version                = "3.35.4"
    replace                = true
#To override the variables,we can either use the set block to set the variables individually or use yaml file.
 #in this case,we are making use of the yaml set file to do that.
  /*  set {
        name = "args[0]"
        value = "--kubelet-insecure-tls"
    }  */
 values = [file("values/argocd.yaml")]

 #depends_on = [aws_eks_node_group.general]
 }