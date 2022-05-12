# Core Concepts

## Switch Namespace

```shell
kubectl config set-context $(kubectl config current-context) --namespace=dev
kubectl config set-context $(kubectl config current-context) --namespace=prod
kubectl config set-context $(kubectl config current-context) --namespace=default
```
