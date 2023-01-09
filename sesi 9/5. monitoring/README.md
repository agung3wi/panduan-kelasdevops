## Install Prometheus Grafana di Kubernetes

Tambahkan package

```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

Install prometheus stack
```
helm install stable prometheus-community/kube-prometheus-stack --namespace monitoring --create-namespace
```

Login grafana dengan
user: admin
password: prom-operator
