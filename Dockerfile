FROM elasticsearch:5.0.2

MAINTAINER Boris Belozovsky <boriska70@gmail.com>

RUN /bin/echo https_proxy=$https_proxy > ~/.wgetrc

COPY elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

RUN /usr/bin/wget https://artifacts.elastic.co/downloads/packs/x-pack/x-pack-5.0.2.zip -O /tmp/x-pack-5.0.2.zip
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch file:///tmp/x-pack-5.0.2.zip

RUN /usr/bin/wget https://artifacts.elastic.co/downloads/elasticsearch-plugins/discovery-ec2/discovery-ec2-5.0.2.zip -O /tmp/discovery-ec2-5.0.2.zip
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch file:///tmp/discovery-ec2-5.0.2.zip

RUN /usr/bin/wget https://artifacts.elastic.co/downloads/elasticsearch-plugins/repository-s3/repository-s3-5.0.2.zip -O /tmp/repository-s3-5.0.2.zip
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch file:///tmp/repository-s3-5.0.2.zip
