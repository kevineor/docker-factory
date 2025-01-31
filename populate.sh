
docker tag joxit/docker-registry-ui:static localhost:5001/joxit/docker-registry-ui:static
docker tag joxit/docker-registry-ui:static localhost:5001/joxit/docker-registry-ui:0.3
docker tag joxit/docker-registry-ui:static localhost:5001/joxit/docker-registry-ui:0.3.0
docker tag joxit/docker-registry-ui:static localhost:5001/joxit/docker-registry-ui:0.3.0-static
docker tag joxit/docker-registry-ui:static localhost:5001/joxit/docker-registry-ui:0.3-static

docker push localhost:5001/joxit/docker-registry-ui:static
