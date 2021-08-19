# Build docker images and upload to microk8s ctr
build:
	docker build ./services/auth-server -t auth-server:test
	docker build ./services/target-server -t target-server:test

	# Image must be imported into registry before used
	docker save auth-server > auth-server.tar
	microk8s ctr image import auth-server.tar

	docker save target-server > target-server.tar
	microk8s ctr image import target-server.tar

# Shutdown cluster
shutdown:
	microk8s kubectl delete -R -f kubernetes/

# Get access token to microk8s dashboard
token:
	token=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
	microk8s kubectl -n kube-system describe secret $token

# Update cluster
update:
	microk8s kubectl apply -R -f kubernetes/
