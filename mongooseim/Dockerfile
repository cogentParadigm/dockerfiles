FROM centos:7

MAINTAINER "Ali Gangji" <ali@neonrain.com>

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install epel-release wget && \
    wget https://packages.erlang-solutions.com/erlang-solutions-2.0-1.noarch.rpm && \
    rpm -Uvh erlang-solutions-2.0-1.noarch.rpm && \
    yum -y --setopt=tsflags=nodocs install git openssl make zlib-devel unixODBC-devel openssl-devel gcc gcc-c++ erlang docker-client && \
    yum clean all
RUN git clone https://github.com/esl/MongooseIM.git /opt/MongooseIM
WORKDIR /opt/MongooseIM
ADD src/event_pusher/mod_event_pusher_http.erl /opt/MongooseIM/src/event_pusher/mod_event_pusher_http.erl
ADD src/event_pusher/mod_event_pusher_http_offline.erl /opt/MongooseIM/src/event_pusher/mod_event_pusher_http_offline.erl
RUN ./rebar3 compile && \
    make rel

EXPOSE 5280 5285 8089

CMD ["/opt/MongooseIM/_build/prod/rel/mongooseim/bin/mongooseimctl", "foreground"]
