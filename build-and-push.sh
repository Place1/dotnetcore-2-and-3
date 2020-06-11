#!/bin/bash
set -eou pipefail

docker pull docker:stable

IMAGE="place1/dotnetcore-2-and-3:$(date +%Y.%m.%d)"

docker login
docker build -t "$IMAGE" .
docker push "$IMAGE"

echo "New image pushed: $IMAGE"
