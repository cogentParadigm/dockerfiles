FROM centos:7

MAINTAINER "Ali Gangji" <ali@neonrain.com>

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install epel-release && \
    yum -y --setopt=tsflags=nodocs install git ansible && \
    yum clean all
RUN git clone https://github.com/cogentParadigm/ansible-playbook-development.git /opt/src/ansible-playbook
WORKDIR /opt/src/ansible-playbook
RUN git fetch && \
    git checkout d0ce8fa
ADD config.yml /opt/src/ansible-playbook/config.yml
RUN ansible-playbook -i inventory main.yml
ADD server.key /etc/pki/tls/private/localhost.key
ADD server.crt /etc/pki/tls/certs/localhost.crt
ADD php.conf /etc/httpd/conf.d/php.conf

WORKDIR /var/www/html

EXPOSE 80
EXPOSE 443

ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]
