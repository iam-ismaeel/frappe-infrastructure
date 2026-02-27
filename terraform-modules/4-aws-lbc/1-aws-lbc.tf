#for creating assume_policy,we use data resource.

data "aws_iam_policy_document" "aws_lbc" {
    statement {
        effect = "Allow"

        principals {
            type = "Service"
            identifiers = ["pods.eks.amazonaws.com"]     #For our aws_lbc to be able to crate the respective LBs,we are using pod identities.
        }

        actions = [
            "sts:AssumeRole",
            "sts:TagSession"
        ]
    }
}
#attach the assume policy to the role. [note that this is the same as creating IAM role with assume role policy in it,but in this case,it is data source we decide to use with a resource.]
resource "aws_iam_role" "aws_lbc" {
    name                = "${var.cluster_name}-aws-lbc"
    assume_role_policy  = data.aws_iam_policy_document.aws_lbc.json
}

# Create an IAM policy for the aws-lbc that defines the actual permissions in aws.[creating file and loading this policy to terraform resource]
resource "aws_iam_policy" "aws_lbc" {
    policy = file("./iam/AWSLoadBalancerController.json")
    name   = "AWSLoadBalancerController"
}
#attach this policy to iam role which will be used by this controller
resource "aws_iam_role_policy_attachment" "aws_lbc" {
    policy_arn = aws_iam_policy.aws_lbc.arn
    role       = aws_iam_role.aws_lbc.name
}

#links this role with k8s service account,and deploy this controller with kube-system namespace.
resource "aws_eks_pod_identity_association" "aws_lbc" {
    cluster_name    =  "${var.cluster_name}"
    namespace       = "kube-system"
    service_account = "aws-load-balancer-controller"
    role_arn        =  aws_iam_role.aws_lbc.arn
}

#we need to deploy the controller to EKS using a helm-chart
resource "helm_release" "aws_lbc" {
    name       = "aws-load-balancer-controller"
    repository = "https://aws.github.io/eks-charts"
    chart      = "aws-load-balancer-controller"
    namespace  = "kube-system"
    version    = "1.8.1"

    set {
        name = "clusterName"
        value = "${var.cluster_name}"
    }  

    set {
        name = "serviceAccount.name"
        value = "aws-load-balancer-controller"
    }  
#This must match your region

     set {
        name = "awsRegion"
        value = "us-east-1"
    }  

 depends_on = [helm_release.cluster_autoscaler]     #you can as well use aws_eks_node_group.general to deploy multiple helm charts in parallel
 }

 #we still need to create an IAM policy json file,to dynamically add a resource contraints,you would probaby add a template 
 #file terraform function and parse it during creation.
 
 
