#!/bin/bash

# Create the namespace
kubectl apply -f trandoshan/namespace.yaml

# Install tor-proxy
kubectl apply -f trandoshan/tor-proxy/deployment.yaml
kubectl apply -f trandoshan/tor-proxy/service.yaml

# Install RabbitMQ using helm
kubectl apply -f trandoshan/rabbitmq/definitions.yaml
helm install --namespace trandoshan-io --name rabbitmq -f trandoshan/rabbitmq/config.yaml stable/rabbitmq

# Install dashboard
#kubectl apply -f dashboard.yaml
#kubectl apply -f dashboard-user.yaml
#kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
#url: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.