#!/bin/bash

set -x 

mkdir -p setup_demo

rm -rf setup_demo/*

cd setup_demo

git clone https://github.com/imsrv01/argocd-rollout.git

cd argocd-rollout/install/ansible/openshift-gitops

ansible-playbook install-openshift-gitops.yaml

cd -

git clone https://github.com/imsrv01/openshift-servicemesh.git

cd openshift-servicemesh/install/ansible/servicemesh

ansible-playbook install-service-mesh.yaml

git clone https://github.com/imsrv01/argocd-rollout.git

cd -

cd argocd-rollout/demo/canary-istio-dest

oc apply -f service-mesh-member-roll.yaml

oc apply -f application.yaml