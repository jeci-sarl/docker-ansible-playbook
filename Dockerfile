FROM alpine:3.9

RUN apk update \
 && apk add --no-cache \
      --virtual build-dependencies \
      gcc \
			make \
      musl-dev \
      libffi-dev \
      openssl-dev \
      python3-dev \
 && apk add --no-cache \
      python3 \
      openssh-client \
 && pip3 install \
      ansible \
 && apk del build-dependencies \
 && rm -rf /var/cache/apk/

ENV ANSIBLE_GATHERING=smart \
    ANSIBLE_HOST_KEY_CHECKING=false \
    ANSIBLE_RETRY_FILES_ENABLED=false

VOLUME  /ansible
WORKDIR /ansible

ENTRYPOINT ["/usr/bin/ansible-playbook"]
