FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

ADD https://bootstrap.pypa.io/get-pip.py /tmp/get-pip.py

RUN set -e \
      && ln -sf bash /bin/sh \
      && ln -s python3 /usr/bin/python

RUN set -e \
      && apt-get -y update \
      && apt-get -y dist-upgrade \
      && apt-get -y install --no-install-recommends --no-install-suggests \
        apt-transport-https ca-certificates curl g++ python3 python3-distutils \
      && apt-get -y autoremove \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN set -e \
      && /usr/bin/python3 /tmp/get-pip.py \
      && pip install -U --no-cache-dir pip \
      && CMAKE_ARGS='-DLLAMA_CUBLAS=on' FORCE_CMAKE=1 \
        pip install -U --no-cache-dir llama-cpp-python

ENTRYPOINT ["/usr/bin/python"]
CMD ["-c", "import llama_cpp; print(llama_cpp.__version__);"]