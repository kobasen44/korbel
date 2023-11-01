podman build -t korbel .
podman tag korbel kobasen44/korbel:006
podman login docker.io
podman push kobasen44/korbel:006
podman logout docker.io