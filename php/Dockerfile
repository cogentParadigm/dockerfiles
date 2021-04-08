FROM centos:7

MAINTAINER "Ali Gangji" <ali@neonrain.com>

ARG PHP_VERSION=7.1

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install epel-release && \
    yum -y --setopt=tsflags=nodocs install git ansible unzip patch file gnupg2 java-latest-openjdk && \
    yum clean all
RUN git clone https://github.com/cogentParadigm/ansible-playbook-development.git /opt/src/ansible-playbook
WORKDIR /opt/src/ansible-playbook
RUN git fetch && \
    git checkout v0.8.4
ADD config.yml /opt/src/ansible-playbook/config.yml
RUN sed -i "s/^php_version:.*/php_version: \\\"$PHP_VERSION\\\"/" config.yml
RUN ansible-playbook -i inventory main.yml && \
    mkdir -p /run/php-fpm
RUN sed -i 's/^display_errors = .*/display_errors = On/' /etc/php.ini
RUN sed -i 's/^error_log = .*/error_log = \/proc\/self\/fd\/2/' /etc/php-fpm.conf
RUN sed -i 's/^;access.log = .*/access.log = \/proc\/self\/fd\/2/' /etc/php-fpm.d/www.conf
RUN sed -i 's/^;catch_workers_output = .*/catch_workers_output = yes/' /etc/php-fpm.d/www.conf
RUN sed -i 's/^listen = .*/listen = 9000/' /etc/php-fpm.d/www.conf
RUN sed -i 's/^listen.allowed_clients =/;listen.allowed_clients =/' /etc/php-fpm.d/www.conf
RUN echo "xdebug.remote_host=host.docker.internal" >> /etc/php.ini
RUN source ~/.bashrc && npm install -g less grunt

COPY bin/precreate-user.sh /usr/local/bin/precreate-user.sh

WORKDIR /var/www/html

EXPOSE 9000

CMD ["php-fpm", "-F"]
