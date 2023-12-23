# k8s-gitops-practice


A managed collection of manifests is known as an Application within Argo CD. Therefore, you must define it as such using an Application CR (CustomResource) in order to have Argo CD apply these manifests in your cluster.

## Quick Start ##
1. oc adm policy add-role-to-user admin system:serviceaccount:openshift-gitops:openshift-gitops-argocd-application-controller -n <Namespace_Name>
2. Deploy argocd-application.yaml

## References ##

1. ArgoCD x tekton x Helm Chart
    1. https://github.com/davidseve/cloud-native-deployment-strategies
   
