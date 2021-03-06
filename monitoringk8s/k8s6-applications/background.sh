#!/bin/bash
# mkdir k8s-yaml-files
curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash
touch status.txt
echo "">/root/status.txt
if [ ! -f "/root/provisioned6app" ]; then
  wall -n "Cloning the Github Repo"
  git clone https://github.com/burningion/distributed-tracing-with-apm-workshop trace
  cd trace
  wall -n "Checking out the right branch"
  git checkout -b k8s-autodiscovery 4b0c105fb3158d0418226642b5a3160c020164e8 # locked to commit on may 6, 2019
  cd ..
  wall -n "Getting everything into the right place"
  mv trace/* .
  mv nginx.yaml k8s-yaml-files/nginx.yaml
  cd k8s-yaml-files
  sudo sed -i '16d' datadog-agent.yaml #hostnetwork
  sudo sed -i 's/extensions\/v1beta1/apps\/v1/g' datadog-agent.yaml
  sudo sed -i 's/6.11.1/6.27.0/' datadog-agent.yaml #agent version
  sudo sed -i '/updateStrategy:/i \ \ selector:\n\ \ \ \ matchLabels:\n\ \ \ \ \ \ app:\ datadog-agent' datadog-agent.yaml
fi

wall -n "Creating Kubernetes Secrets"
kubeloopstart=`date +%s`
until kubectl create secret generic postgres-user --from-literal=token=datadog
do
  kubeloopend=`date +%s`
  kubeloopruntime=$((kubeloopend-kubeloopstart))
  echo "kubectl isn't ready yet."
  echo "It has been $kubeloopruntime seconds"
  echo "If this doesn't resolve after 60 seconds, contact support."
  sleep 2
done

kubectl create secret generic postgres-password --from-literal=token=datadog
wall -n "Starting services"
kubectl apply -f redis-deploy.yaml
kubectl apply -f postgres-deploy.yaml
kubectl apply -f node-api.yaml
kubectl apply -f pumps-service.yaml
kubectl apply -f sensors-api.yaml
kubectl apply -f frontend-service.yaml
kubectl apply -f datadog-agent.yaml

wall -n "Provisioning complete. If you don't see a prompt, just press enter now."
echo "complete">>/root/status.txt

