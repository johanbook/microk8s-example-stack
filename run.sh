docker build ./services/auth-server -t auth-server:test
docker build ./services/target-server -t target-server:test

# Image must be imported into registry before used
docker save auth-server > auth-server.tar
microk8s ctr image import auth-server.tar

docker save target-server > target-server.tar
microk8s ctr image import target-server.tar

microk8s kubectl apply -R -f kubernetes/
