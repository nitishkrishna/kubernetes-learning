#!/bin/bash

## Create a deployment

kubectl create -f nginx-deployment.yaml --record=true

kubectl get deployments

kubectl rollout status deployment.v1.apps/nginx-deployment

kubectl get rs
kubectl get pods --show-labels

## Update deployment

kubectl set image deployment.v1.apps/nginx-deployment nginx=nginx:1.9.1 --record=true
# Or
kubectl edit deployment.v1.apps/nginx-deployment
# change .spec.template.spec.containers[0].image from nginx:1.7.9 to nginx:1.9.1

# Check rollout status
kubectl rollout status deployment.v1.apps/nginx-deployment

## Rolling Back Deployment

# Get rollout history
kubectl rollout history deployment.v1.apps/nginx-deployment

# Go to previous revision
kubectl rollout undo deployment.v1.apps/nginx-deployment

# Go to specific previsious revision
kubectl rollout undo deployment.v1.apps/nginx-deployment --to-revision=2

## Scaling a deployment
kubectl scale deployment.v1.apps/nginx-deployment --replicas=10

# Autoscaling according to CPU load
kubectl autoscale deployment.v1.apps/nginx-deployment --min=10 --max=15 --cpu-percent=80

# Pause a Rollout before updates
kubectl rollout pause deployment.v1.apps/nginx-deployment

# Make changes to deployment
kubectl set image deployment.v1.apps/nginx-deployment nginx=nginx:1.9.1
kubectl set resources deployment.v1.apps/nginx-deployment -c=nginx --limits=cpu=200m,memory=512Mi

# Resume the rollout after applying updates
kubectl rollout resume deployment.v1.apps/nginx-deployment
