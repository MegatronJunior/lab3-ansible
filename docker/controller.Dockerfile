FROM ubuntu:24.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ansible openssh-client ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace/ansible
CMD ["sleep", "infinity"]
