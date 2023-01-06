
### Install ingress nginx
```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-controller ingress-nginx/ingress-nginx
```

Untuk Case di AWS EKS install ingress nginx dapat dilakukan dengan 
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-0.32.0/deploy/static/provider/aws/deploy.yaml
```


### Install Cert Manager
```
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --set installCRDs=true
```

## apply staging and production issuer
```
kubectl apply -f staging.yml
```

```
kubectl apply -f prod.yml
```

## sample ingress ssl
```
kubectl apply -f sample_ingress_ssl.yml
```
