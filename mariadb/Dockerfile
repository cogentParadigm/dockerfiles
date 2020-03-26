FROM centos:7

MAINTAINER "Ali Gangji" <ali@neonrain.com>

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install epel-release && \
    yum -y --setopt=tsflags=nodocs install sudo git ansible && \
    yum clean all
RUN git clone https://github.com/cogentParadigm/ansible-playbook-development.git /opt/src/ansible-playbook
WORKDIR /opt/src/ansible-playbook
RUN git fetch && \
    git checkout ab4e43a6104bb088bc89ecc6b2dd9d832cede7eb
ADD start.yml /opt/src/ansible-playbook/roles/mariadb/tasks/start.yml
ADD config.yml /opt/src/ansible-playbook/config.yml
RUN ansible-playbook -i inventory main.yml && \
    mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root mysql && \
    pkill mysqld

EXPOSE 3306

CMD ["mysqld", "--user=mysql"]
