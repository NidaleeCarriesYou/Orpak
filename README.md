# **README.md**

## **Scalable and Secure Web Application Infrastructure**

This project demonstrates the design and implementation of a scalable and secure infrastructure for a simple web application using Infrastructure as Code (IaC). The project follows best practices in security, containerization, deployment, and monitoring.

## **Table of Contents**

Architecture Overview
Prerequisites
AWS Infrastructure Setup using Terraform
Containerization using Docker
Kubernetes Deployment
Monitoring and Logging
Scripts for Easy Setup
CI/CD Pipeline using GitHub Actions
Security Considerations

## **1. Architecture Overview**

The infrastructure consists of:
- AWS Elastic Kubernetes Service (EKS) for running Kubernetes clusters.
- A Virtual Private Cloud (VPC) with public and private subnets.
- Load balancer to distribute incoming traffic.
- Security groups to control traffic between the components.
- CI/CD pipeline using GitHub Actions for automated deployment and validation.
- Prometheus and Grafana for monitoring and Loki for log aggregation.

## **2. Prerequisites**

Ensure you have the following installed:
- AWS CLI (configured with appropriate IAM permissions)
- Terraform (>= v1.5.0)
- Docker
- kubectl
- Helm

You will also need an **AWS account**.


## **3. AWS Infrastructure Setup using Terraform**
The AWS infrastructure is created using Terraform.

### **Step 1: Clone the repository**

git clone https://github.com/NidaleeCarriesYou/Orpak.git
cd terraform-eks

### **Step 2: Configure AWS Credentials**
Ensure your AWS credentials are configured.
aws configure
### **Step 3: Initialize Terraform**
terraform init

### **Step 4: Apply the Terraform Configuration**
This will create the EKS cluster, VPC, subnets, load balancer, and security groups.

terraform apply -auto-approve

## **4. Containerization**

The web application is containerized using Docker.

### **Dockerfile**

Built a Dockerfile to include application needs for multi-stage build.

## **5. Kubernetes Deployment**

**Step 1: Apply Kubernetes Manifests:**

**ConfigMap and Secret:**

    kubectl apply -f k8s-manifests/configmap.yaml
    kubectl apply -f k8s-manifests/secret.yaml

**Deployment:**

    kubectl apply -f k8s-manifests/deployment.yaml

**Service:**

    kubectl apply -f k8s-manifests/service.yaml

**Horizontal Pod Autoscaler (HPA):**

    kubectl apply -f k8s-manifests/hpa.yaml


**Verify Deployment**

kubectl get pods
kubectl get svc

**6. Monitoring and Logging**

**Step 1: Install Prometheus and Grafana**

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus-stack prometheus-community/kube-prometheus-stack

**Step 2: Install Loki for Logging**
helm repo add grafana https://grafana.github.io/helm-charts
helm install loki-stack grafana/loki-stack

**Step 3: Access Grafana Dashboard**
Port-forward Grafana:

kubectl port-forward svc/prometheus-stack-grafana 3000:80

Open:

http://localhost:3000
Default credentials:
- **Username:** admin
- **Password:** prom-operator

**7. Scripts for Easy Setup**

`setup.sh`** (Bash Script) located at the root of the project.

**8. CI/CD Pipeline using GitHub Actions**

**GitHub Actions Workflow (`.github/workflows/ci_cd_pipeline.yml`)**
This GH Action runs upon every push to the main branch.

## **9. Security Considerations**
- Use **IAM roles** with least privilege.
- Ensure **secrets** are managed using **Kubernetes Secrets**.
- Limit **public access** to resources using security groups.


## **Conclusion:**
This project implements a complete **scalable and secure infrastructure** for a web application using **AWS EKS, Docker, Kubernetes, Prometheus, and Grafana**. The provided manifests and scripts automate the setup and make it easy to deploy and manage the infrastructure.

