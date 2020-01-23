FROM centos:7

MAINTAINER "Ali Gangji" <ali@neonrain.com>

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install epel-release && \
    yum -y --setopt=tsflags=nodocs install git ansible && \
    yum clean all
RUN git clone https://github.com/cogentParadigm/ansible-playbook-development.git /opt/src/ansible-playbook
WORKDIR /opt/src/ansible-playbook
RUN git fetch && \
    git checkout 0a6165d
ADD config.yml /opt/src/ansible-playbook/config.yml
RUN ansible-playbook -i inventory main.yml && \
    mkdir /run/php-fpm
RUN sed -i 's/^listen = .*/listen = 9000/' /etc/php-fpm.d/www.conf
RUN sed -i 's/^listen.allowed_clients =/;listen.allowed_clients =/' /etc/php-fpm.d/www.conf

WORKDIR /var/www/html

EXPOSE 9000

CMD ["php-fpm", "-F"]