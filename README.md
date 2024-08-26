# distroless_flask

## Description
Example repo with flask inside a Distroless container build with buildah.
This Project is inspired by [ubi-flask](https://github.com/major/ubi-flask).

## Usage

With Docker:
```shell
docker run -p 10000:10000 ghcr.io/53845714nf/distroless_flask/distroless_flask:latest 
```

With Podman:
```shell
podman run -p 10000:10000 ghcr.io/53845714nf/distroless_flask/distroless_flask:latest
```
