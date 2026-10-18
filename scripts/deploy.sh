#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

CLUSTER=${CLUSTER:-chat-app}
TAG=${TAG:-$(git describe --always --dirty=-dirty-$(date +%s))}

kind get clusters | grep -x "$CLUSTER" >/dev/null || kind create cluster --name "$CLUSTER"
kubectl config use-context kind-$CLUSTER

docker build -t chat-api:$TAG --build-arg VERSION=$TAG api
docker build -t chat-client:$TAG client
kind load docker-image chat-api:$TAG chat-client:$TAG --name "$CLUSTER"

kubectl create namespace chat-app --dry-run=client -o yaml | kubectl apply -f -
if ! kubectl -n chat-app get secret chat-secrets >/dev/null 2>&1; then
  pass=$(openssl rand -hex 16)
  kubectl -n chat-app create secret generic chat-secrets \
    --from-literal=JWT_SECRET=$(openssl rand -hex 32) \
    --from-literal=MONGO_PASSWORD=$pass \
    --from-literal=MONGO_URL="mongodb://root:$pass@mongo:27017/chat?authSource=admin"
fi

helm upgrade --install chat-app deploy/chart -n chat-app --set tag=$TAG --description "deploy $TAG" --wait --timeout 5m "$@"
