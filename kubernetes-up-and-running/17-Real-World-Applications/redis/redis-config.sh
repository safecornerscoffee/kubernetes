#!/bin/bash
kubectl create configmap \
--from-file=master.conf=./master.conf \
--from-file=slave.conf=./slave.conf \
--from-file=sentinel.conf=./sentinel.conf \
--from-file=init.sh=./init.sh \
--from-file=sentinel.sh=./sentinel.sh \
redis-config