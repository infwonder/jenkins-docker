FROM jenkins/jenkins:lts
MAINTAINER jasonlin@11be.org
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
VOLUME /var/jenkins_home
USER root
RUN mkdir -p /tmp/download && \
 curl -L https://download.docker.com/linux/static/stable/x86_64/docker-18.03.1-ce.tgz | tar -xz -C /tmp/download && \
 rm -rf /tmp/download/docker/dockerd && \
 mv /tmp/download/docker/docker* /usr/local/bin/ && \
 rm -rf /tmp/download && \
 groupadd -g 999 docker && \
 usermod -aG staff,docker jenkins
RUN apt-get -y update && apt-get install -y build-essential
USER jenkins
