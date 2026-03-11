#!/bin/bash

echo "🚀 Starting Enterprise Cloud-Native POS Setup..."

# 1. Deploy Database
echo "📦 Deploying PostgreSQL Database..."
helm repo add bitnami https://charts.bitnami.com/bitnami &>/dev/null
helm upgrade --install my-db-postgresql bitnami/postgresql \
  --set auth.postgresPassword=pospassword123 \
  --set auth.database=pos_db \
  --set fullnameOverride=my-db-postgresql &>/dev/null

# 2. Deploy POS App
echo "🛒 Deploying POS Application..."
helm upgrade --install my-pos-release ./my-pos-chart &>/dev/null

# 3. Deploy pgAdmin
echo "🐘 Deploying pgAdmin..."
helm repo add runix https://helm.runix.net &>/dev/null
helm upgrade --install my-pgadmin runix/pgadmin4 \
  --set env.email=admin@admin.com \
  --set env.password=adminpass \
  --set service.type=LoadBalancer \
  --set service.port=5050 &>/dev/null

# 4. Deploy Prometheus (Metrics Engine)
echo "⚙️ Deploying Prometheus Metrics Engine..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts &>/dev/null
helm upgrade --install prometheus prometheus-community/prometheus \
  --set server.persistentVolume.enabled=false \
  --set alertmanager.persistentVolume.enabled=false &>/dev/null

# 5. Deploy Grafana
echo "📊 Deploying Grafana..."
helm repo add grafana https://grafana.github.io/helm-charts &>/dev/null
helm upgrade --install my-grafana grafana/grafana \
  --set service.type=LoadBalancer \
  --set service.port=3000 \
  --set service.targetPort=3000 &>/dev/null

# 6. Deploy ArgoCD
echo "🐙 Deploying ArgoCD..."
kubectl create namespace argocd &>/dev/null
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml &>/dev/null
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}' &>/dev/null

echo "⏳ Waiting for Kubernetes to assign IPs and generate passwords (takes about 60 seconds)..."
sleep 60

# Fetch the Server IP
NODE_IP=$(kubectl get nodes -o jsonpath='{.items[0].status.addresses[?(@.type=="InternalIP")].address}')

# Fetch the hidden passwords
ARGOCD_PASS=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d 2>/dev/null)
GRAFANA_PASS=$(kubectl get secret --namespace default my-grafana -o jsonpath="{.data.admin-password}" | base64 -d 2>/dev/null)

# Print the final output
echo ""
echo "================================================================="
echo "✨ CLOUD-NATIVE POS ENVIRONMENT READY ✨"
echo "================================================================="
echo "🛒 POS Application"
echo "   URL:      http://$NODE_IP:5000"
echo "   Username: admin"
echo "   Password: adminpass"
echo "-----------------------------------------------------------------"
echo "🐘 pgAdmin (Database UI)"
echo "   URL:      http://$NODE_IP:5050"
echo "   Username: admin@admin.com"
echo "   Password: adminpass"
echo "-----------------------------------------------------------------"
echo "📊 Grafana (Dashboards)"
echo "   URL:      http://$NODE_IP:3000"
echo "   Username: admin"
echo "   Password: $GRAFANA_PASS"
echo "-----------------------------------------------------------------"
echo "🐙 ArgoCD (GitOps)"
echo "   URL:      https://$NODE_IP:31903"
echo "   Username: admin"
echo "   Password: $ARGOCD_PASS"
echo "================================================================="
echo "🎥 You are ready to record your demo!"
echo ""
