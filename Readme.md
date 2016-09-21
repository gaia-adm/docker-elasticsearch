[![Circle CI](https://circleci.com/gh/gaia-adm/docker-elasticsearch.svg?style=svg)](https://circleci.com/gh/gaia-adm/docker-elasticsearch)

# Customizable Elasticsearch 2.1 image

Including head, kopf and hq plugins

AWS_REGION environment variable should be set to run in AWS

Automation flow builds the AWS flavor only that does not run well on vagrant  

In order to have Elasticsearch running on vagrant successfully, gaiaadm/elasticsearch-vagrant image is used; this image must be updated manually when needed by executing:
```docker build -t gaiaadm/elasticsearch-vagrant -f Dockerfile-vagrant --build-arg PROXY_IP=<proxy ip, not a hostname> --build-arg PROXY_PORT=<proxy port> .```
No versioning supported for elasticsearch-vagrant, the latest one will be used on deployment.
