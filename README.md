docker-llama-cpp-python
=======================

Dockerfile for llama-cpp-python

[![CI to Docker Hub](https://github.com/dceoy/docker-llama-cpp-python/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/dceoy/docker-llama-cpp-python/actions/workflows/docker-publish.yml)

Docker image
------------

Pull the image from [Docker Hub](https://hub.docker.com/r/dceoy/llama-cpp-python/).

```sh
$ docker image pull dceoy/llama-cpp-python
```

Usage
-----

Test the package.

```sh
$ docker container run --rm dceoy/llama-cpp-python
```

Test text generation.

```sh
$ docker container run \
    --rm --entrypoint /wd/chat.sh -v "${PWD}:/wd" -w /wd \
    dceoy/llama-cpp-python \
    'Name the planets in the solar system?'
```
