#!/bin/bash

# Expose the Pod to the public internet using the kubectl expose command
kubectl expose deployment hello-node --type=LoadBalancer
# View the Service you just created
kubectl get services

# Get Service Open
minikube service hello-node
