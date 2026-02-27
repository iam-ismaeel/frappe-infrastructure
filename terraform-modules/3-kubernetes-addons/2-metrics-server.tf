resource "helm_release" "metrics_server" {
    name = "metrics-server"

    repository = "https://kubernetes-sigs.github.io/metrics-server/"
    chart      = "metrics-server"
    namespace  = "kube-system"
    version    = "3.12.1"
#To override the variables,we can either use the set block to set the variables individually or use yaml file.
 #in this case,we are making use of the yaml set file to do that.
  /*  set {
        name = "args[0]"
        value = "--kubelet-insecure-tls"
    }  */
 values = [file("${path.module}/values/metrics-server.yaml")]

 #depends_on = [aws_eks_node_group.general]
 }