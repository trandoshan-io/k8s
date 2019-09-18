#!/bin/bash

# Create the namespace
kubectl apply -f trandoshan/namespace.yaml

# Install tor-proxy
kubectl apply -f trandoshan/tor-proxy/deployment.yaml
kubectl apply -f trandoshan/tor-proxy/service.yaml

# Install NATS using helm
helm install --namespace trandoshan-io --name messaging-system -f trandoshan/nats-config.yaml stable/nats

# Install dashboard
#kubectl apply -f dashboard.yaml
#kubectl apply -f dashboard-user.yaml
#kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
#url: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.