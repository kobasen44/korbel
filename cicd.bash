#docker buildx build --platform linux/amd64 -t korbel .
docker build -t korbel .

docker tag korbel kobasen44/korbel:012
docker login docker.io
docker push kobasen44/korbel:012
docker logout docker.io