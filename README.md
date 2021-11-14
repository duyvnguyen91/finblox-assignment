# finblox-assignment

## Terraform
I. Environment preparation:
  1. install aws sdk
     https://docs.aws.amazon.com/cli/latest/userguide/install-macos.html
  2. configuration for aws in local machine
     aws configure

II. Terraform
   - terraform init --upgrade
   - terraform plan
   - terraform apply

## EKS
1. Access cluster
`aws eks --region ap-southeast-1 update-kubeconfig --name duynv-cluster`

2. Install public nginx
```bash
helm upgrade --install public ingress-nginx/ingress-nginx -n nginx-ingress --set controller.kind=Deployment --set controller.service.type=LoadBalancer --set controller.service.externalTrafficPolicy=Local --set controller.admissionWebhooks.enabled=false --set controller.service.ports.http=80 --set controller.service.ports.https=443 --set controller.autoscaling.enabled=true --set controller.autoscaling.minReplicas=3 --set controller.resources.requests.cpu=150m --set controller.resources.requests.memory=300Mi --set controller.autoscaling.targetMemoryUtilizationPercentage=80 --set controller.autoscaling.targetCPUUtilizationPercentage=80 --set controller.ingressClass=public-nginx
```

## Sealed Secret
1. Create secret file
```bash
kubectl create secret generic mysecret --dry-run=client --from-literal=password=supersekret --from-literal=username=test -o json | kubeseal --controller-namespace kube-system  --controller-name sealed-secrets > mysealedsecret.json
```
2. Apply the file 
```bash
kubectl apply -f mysealedsecret.json
```

## Helloworld K8s
Use this domain to access: https://hello.duynv.info
