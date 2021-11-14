helm upgrade --install public ingress-nginx/ingress-nginx -n nginx-ingress --set controller.kind=Deployment --set controller.service.type=LoadBalancer --set controller.service.externalTrafficPolicy=Local --set controller.admissionWebhooks.enabled=false --set controller.service.ports.http=80 --set controller.service.ports.https=443 --set controller.autoscaling.enabled=true --set controller.autoscaling.minReplicas=3 --set controller.resources.requests.cpu=150m --set controller.resources.requests.memory=300Mi --set controller.autoscaling.targetMemoryUtilizationPercentage=80 --set controller.autoscaling.targetCPUUtilizationPercentage=80 --set controller.ingressClass=public-nginx