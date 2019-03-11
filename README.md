# Docker Image for Ansible-Playbook

Use to run playbook from ci/cd

Thanks to https://ruleoftech.com/2017/dockerizing-all-the-things-running-ansible-inside-docker-container that help me a lot.

## Usage


* Basic Usage

``` bash
docker run --rm -it \
  -u "$(id -u):$(id -g)" \
  -e HOME -e USER \
  -v "/etc/passwd:/etc/passwd:ro" \
  -v "/etc/group:/etc/group:ro" \
	--tmpfs "$HOME/.ansible" \
  -v "$PWD:/ansible" \
  jeci/ansible-playbook -i hosts.yml playbooks/system_release.yml
```

* Using ssh authentication from current user

``` bash
docker run --rm -it \
  -u "$(id -u):$(id -g)" \
	-e HOME -e USER \
	-e SSH_AUTH_SOCK=/ssh-agent \
  -v "$SSH_AUTH_SOCK:/ssh-agent:ro" \
  -v "$HOME/.ssh/:$HOME/.ssh/:ro" \
	-v "/etc/passwd:/etc/passwd:ro" \
  -v "/etc/group:/etc/group:ro" \
	--tmpfs "$HOME/.ansible" \
  -v "$PWD:/ansible" \
	jeci/ansible-playbook -i hosts.yml playbooks/system_release.yml
```

## Env

* `ANSIBLE_GATHERING=smart`
* `ANSIBLE_HOST_KEY_CHECKING=false`
* `ANSIBLE_RETRY_FILES_ENABLED=false`

## Volume

* `/ansible` 



