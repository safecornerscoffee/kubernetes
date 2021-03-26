```bash
jupyter_pod_name=$(kubectl get pods --namespace=jupyter --no-headers | awk '{print $1}')

kubectl logs --namespace=jupyter ${jupyter_pod_name}

kubectl port-forward ${jupyter_pod_name} 8888:8888 --namespace=jupyter
```

