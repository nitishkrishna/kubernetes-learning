#!/bin/bash

# Single Instance Stateful App
# Cannot scale, attached PV

# Create PV and PVC for MySQL
kubectl create -f mysql-pv.yaml

# Create Deployment and Service for MySQL
kubectl create -f mysql-deployment.yaml

# Check deployment and Persistent Volume
kubectl describe deployment mysql

kubectl describe pvc mysql-pv-claim

# Connect to MySQL using a client Pod
kubectl run -it --rm --image=mysql:5.6 --restart=Never mysql-client -- mysql -h mysql -ppassword
