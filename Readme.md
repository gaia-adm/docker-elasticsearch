[![Circle CI](https://circleci.com/gh/gaia-adm/docker-elasticsearch.svg?style=svg)](https://circleci.com/gh/gaia-adm/docker-elasticsearch)

# Customizable Elasticsearch 5.0.2 image

Including X-PACK for basic monitoring and AWS related plugins

AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and AWS_REGION environment variable should be set to run in AWS

Automation flow builds the AWS flavor only that does not run well on vagrant  

In order to have Elasticsearch running on vagrant successfully, gaiaadm/elasticsearch-vagrant image is used; this image must be updated manually when needed by executing:
```docker build -t gaiaadm/elasticsearch-vagrant -f Dockerfile-vagrant --build-arg https_proxy=http://fdsdssdf  .```
No versioning supported for elasticsearch-vagrant, the latest one will be used on deployment.

CHANGES while upgrading from 2.3:
- sysctl vm.max_map_count=262144 on host machine (https://www.freedesktop.org/software/systemd/man/systemd.exec.html)
- install X-PACK
  - wget https://artifacts.elastic.co/downloads/packs/x-pack/x-pack-5.0.2.zip -O /tmp/x-pack-5.0.2.zip
  - bin/elasticsearch-plugin install --batch file:///tmp/x-pack-5.0.2.zip
- install discovery-ec2 plugin
  - wget https://artifacts.elastic.co/downloads/elasticsearch-plugins/discovery-ec2/discovery-ec2-5.0.2.zip -O /tmp/discovery-ec2-5.0.2.zip
  - bin/elasticsearch-plugin install --batch file:///tmp/discovery-ec2-5.0.2.zip
  - add allocation awareness (elasticsearch.yml):
    - cloud.node.auto_attributes: true
    - cluster.routing.allocation.awareness.attributes: aws_availability_zone
- install repository-s3 plugins
  - wget https://artifacts.elastic.co/downloads/elasticsearch-plugins/repository-s3/repository-s3-5.0.2.zip -O /tmp/repository-s3-5.0.2.zip
  - bin/elasticsearch-plugin install --batch file:///tmp/repository-s3-5.0.2.zip
- docker build --build-arg https_proxy=http://fdsdssdf -t gaiaadm/elasticsearch
- docker run with ```--ulimit memlock=-1:-1``` and some other memory settings added to the service-file (see https://www.freedesktop.org/software/systemd/man/systemd.exec.html for mor details)
- memory settings are static: -e ES_JAVA_OPTS="-Xms1600m -Xmx1600m" . Must be made dynamic
