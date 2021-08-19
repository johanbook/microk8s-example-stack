# microk8s-example-stack

This is a PoC for a microk8s stack using Traefik IngressRoute as ingress
controller.

## Installing

To spin up the cluster, begin by installing microk8s. Then run

```sh
make start
make install
make build
make update
```

Finally, to access the Traefik service, use `make proxy`. This will dynamically
allocate a port on localhost where the edge router is exposed.
