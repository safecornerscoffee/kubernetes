#!/bin/bash
docker run -it --rm \
--network etcd_test \
--env ALLOW_NONE_AUTHENTICATION=yes \
bitnami/etcd etcdctl --endpoints=http://etcd:2379 get /message