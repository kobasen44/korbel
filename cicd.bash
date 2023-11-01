podman buildx build --platform linux/amd64 -t korbel .
podman tag korbel kobasen44/korbel:007
podman login docker.io
podman push kobasen44/korbel:007
#podman logout docker.io