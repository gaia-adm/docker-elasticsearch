FROM elasticsearch:2.1.0

MAINTAINER Boris Belozovsky <boriska70@gmail.com>

#ARG PROXY_IP
#ARG PROXY_PORT

COPY elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

RUN /usr/share/elasticsearch/bin/plugin install cloud-aws 
#RUN /usr/share/elasticsearch/bin/plugin install cloud-aws -DproxyHost=$PROXY_IP -DproxyPort=$PROXY_PORT

RUN /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head 
RUN /usr/share/elasticsearch/bin/plugin install lmenezes/elasticsearch-kopf/2.0 
RUN /usr/share/elasticsearch/bin/plugin install royrusso/elasticsearch-HQ/v2.0.3 
#RUN /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head -DproxyHost=$PROXY_IP -DproxyPort=$PROXY_PORT
#RUN /usr/share/elasticsearch/bin/plugin install lmenezes/elasticsearch-kopf/2.0 -DproxyHost=$PROXY_IP -DproxyPort=$PROXY_PORT
#RUN /usr/share/elasticsearch/bin/plugin install royrusso/elasticsearch-HQ/v2.0.3 -DproxyHost=$PROXY_IP -DproxyPort=$PROXY_PORT
