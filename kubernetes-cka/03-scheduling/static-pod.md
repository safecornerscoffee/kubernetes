# Static Pod

## Filter Static Pods

```shell
kubectl get pods --all-namespaces \
-o jsonpath='{.items[?(@.metadata.ownerReferences..kind=="Node")].metadata.name}'
```

## Static Pod Path

See `staticPodPath` in `/var/lib/kubelet/config` file
