# microk8s-example-stack

This is a PoC for a microk8s stack using both Traefik's IngressRoute and NGINX
as ingress controllers. Traefik's `forwardAuth` middleware is used to emulate
global authentication (although a static response is returned, see
`services/auth-server`).

## Installing

To spin up the cluster, begin by installing microk8s. Then run

```sh
make start
make install
make build
make update
```

The cluster is available on `localhost`.
