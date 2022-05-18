docker network create mynet

docker run -d --net mynet --name opensearch-node1 -p 9200:9200 -p 9600:9600 -e "discovery.type=single-node" opensearchproject/opensearch:1.2.0

docker run -d \
--net mynet \
--name opensearch-dash \
-p 5601:5601 \
-e OPENSEARCH_HOSTS='["https://opensearch-node1:9200"]' \
opensearchproject/opensearch-dashboards:1.2.0
