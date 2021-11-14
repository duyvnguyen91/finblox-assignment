#!/bin/bash
if [[ -z $IMAGE_TAG ]]; then
  echo "IMAGE_TAG is empty"
  exit 1
fi

# envsubst < config.yml | kubectl apply -f -
envsubst < main.yml | kubectl apply -f -
kubectl rollout status deployments/$CI_PROJECT_NAME -n $NAMESPACE

if [[ $? != 0 ]]; then
    kubectl -n $NAMESPACE logs deployments/$CI_PROJECT_NAME --all-containers=true --tail=20 && exit 1;
fi