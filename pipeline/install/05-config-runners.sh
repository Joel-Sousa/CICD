#!/bin/bash

# Ingressar o Runner em modo shell no GitLab
# Se estiver utilizando gitlab.com ou certificado, altere para HTTPS://
sudo gitlab-runner register -n \
  --url http://192.168.101.8 \
  --registration-token Qh5FUzX7sJ5Qns1jPTPi \
  --executor shell \
  --description "Runner Shell"

# Criar o container gitlab-runner para Docker
# Se estiver utilizando gitlab.com ou certificado, altere para HTTPS://
docker run -dit \
  --name runner-docker \
  --restart always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /opt/gitlab-runner/config:/etc/gitlab-runner \
  gitlab/gitlab-runner:ubuntu-v14.9.1

# Ingressar o Runner em modo docker no GitLab
# Se estiver utilizando gitlab.com ou certificado, altere para HTTPS://
docker exec -it runner-docker \
gitlab-runner register -n \
  --url http://192.168.101.8 \
  --registration-token Qh5FUzX7sJ5Qns1jPTPi \
  --clone-url http://192.168.101.8 \
  --description "Runner Docker" \
  --executor docker \
  --docker-image "docker:latest" \
  --docker-privileged

