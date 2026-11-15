FROM ubuntu:24.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends openssh-server python3 ca-certificates && rm -rf /var/lib/apt/lists/*
COPY docker/start-sshd.sh /usr/local/bin/start-sshd.sh
RUN chmod 755 /usr/local/bin/start-sshd.sh

EXPOSE 22
CMD ["/usr/local/bin/start-sshd.sh"]
