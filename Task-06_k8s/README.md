# Task-06_k8s

## Description

This repo will deploy ArgoCD (GitOps CD Tool) which will download and deploy a Guestbook app in Kubernetes

### Instructions

```
1) Download and Install MiniKube
2) Minikube start
3) kubectl apply -f namespace
4) kubectl apply -f crds
5) kubectl config set-context --current --namespace=argocd
6) kubectl apply -f argocd
7) Obtain Password to Login to argocd: 
- kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
8) kubectl -n argocd port-forward svc/argocd-server 8180:80 # Connect to argocd service to login
9) Open Browser and login to argocd to view the app being deployed: http://localhost:8180
username: admin
password: <password_from_output_of_last_command
```  


```10) kubectl -n guestbook port-forward service/guestbook-ui 8080:80```  




