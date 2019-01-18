#!/bin/bash

# Create Deployment
kubectl create hello-node --image=gcr.io/hello-minikube-zero-install/hello-node --port=8080
# View Deployment
kubectl get deployments
# View Pods
kubectl get pods
# View cluster events
kubectl get events
# View the kubectl configuration
kubectl config view
