#!/bin/bash

# Apply Terraform configuration
cd terraform-eks
terraform init
terraform apply -auto-approve

# Apply Kubernetes manifests
cd ../k8s-manifests
kubectl apply -f configmap.yaml
kubectl apply -f secret.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f hpa.yaml

# Install Prometheus and Grafana
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus-stack prometheus-community/kube-prometheus-stack

# Install Loki
helm repo add grafana https://grafana.github.io/helm-charts
helm install loki-stack grafana/loki-stack