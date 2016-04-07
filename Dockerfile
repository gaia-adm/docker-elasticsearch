FROM elasticsearch:2.1.0

MAINTAINER Boris Belozovsky <boriska70@gmail.com>

#ARG PROXY
#ENV http_proxy $PROXY
#ENV https_proxy $PROXY

COPY elasticsearch.yml.big /etc/elasticsearch/elasticsearch.yml
COPY elasticsearch.yml.small /usr/share/elasticsearch/config/elasticsearch.yml

RUN /usr/share/elasticsearch/bin/plugin install cloud-aws

RUN /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head
RUN /usr/share/elasticsearch/bin/plugin install lmenezes/elasticsearch-kopf/2.0
RUN /usr/share/elasticsearch/bin/plugin install royrusso/elasticsearch-HQ/v2.0.3
