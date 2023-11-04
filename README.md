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

Run llama-cpp-python

```sh
$ docker container run --rm -p 7860:7860 -v ${PWD}:/wd -w /wd \
    dceoy/llama-cpp-python run.py
```

Run llama-cpp-python with docker-compose

```sh
$ docker-compose -f /path/to/docker-llama-cpp-python/docker-compose.yml up
```
