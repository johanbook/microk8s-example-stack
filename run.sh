docker build ./target-server -t target-server:latest

# Image must be imported into registry before used
docker save target-server > target-server.tar
microk8s ctr image import target-server.tar

microk8s kubectl apply -f example.yaml
