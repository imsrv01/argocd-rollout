
# Demo application streamlined application deployment using argocd rollout and OpenShift service mesh

## Pre-requisites

## Build new OpenShift cluster or use existing one

### Install argocd operator

        git clone https://github.com/imsrv01/argocd-rollout.git

        cd argocd-rollout/install/ansible/openshift-gitops

        ansible-playbook install-openshift-gitops.yaml

### Install OpenShift Service mesh

        git clone https://github.com/imsrv01/openshift-servicemesh.git

        cd openshift-servicemesh/install/ansible/servicemesh

        ansible-playbook install-service-mesh.yaml

## Deploy demo app

### Add namespace to service mesh

Connect to openshift cluster using oc cli

        git clone https://github.com/imsrv01/argocd-rollout.git

        cd argocd-rollout/demo/canary-istio-dest

        oc apply -f service-mesh-member-roll.yaml

### Deploy demo application using argocd

        oc apply -f application.yaml

### Update gateway & virtual service host url to relect the new cluster domain, do git commit (files - gateway.yaml & virtualservice.yaml)

        hosts:
        - canary-istio-dest-canary-istio-dest.apps.rosa.rosalab2.kq62.p3.openshiftapps.com

### Update deployed route and enable edge termination..

Namesace - istio-system

        spec:
        tls:
            termination: edge

## Validate

Login to argocd console and check the deployed app

Update image in rollout and commit

Promote rollout

