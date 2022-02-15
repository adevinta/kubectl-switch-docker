# kubectl-switch-docker

This Dockerfile builds a Docker image for [tjamet/kubectl-switch].

## Build

```
docker build -t kubectl-switch-docker .
```

## Usage

It is usually fine to run:

```
docker run -ti --rm -v ~/.kube:/home/user/.kube kubectl-switch-docker \
    <kubectl cmd>
```

However, if your uid:gid is not 1000:1000, you will need to run:

```
docker run -ti --rm -u "$(id -u):$(id -g)" -e HOME=/home/user \
    -v ~/.kube:/home/user/.kube kubectl-switch-docker <kubectl cmd>
```

So the container can write the downloaded kubectl binaries into the mounted
volume.

## Versioning

We use [semantic-versioning] for releases. Each release in git has its
corresponding tag in this [dockerhub repository].

## Contributing

**This project is in an early stage, we are not accepting external
contributions yet.**

To contribute, please read the contribution guidelines in [CONTRIBUTING.md].


[tjamet/kubectl-switch]: https://github.com/tjamet/kubectl-switch
[CONTRIBUTING.md]: CONTRIBUTING.md
[semantic-versioning]: https://semver.org/spec/v2.0.0.html
[dockerhub repository]: https://hub.docker.com/r/adevinta/kubectl-switch-docker
