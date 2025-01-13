#!/bin/bash


# 拉取镜像
echo "Pulling image: ${IMAGE}"
docker pull ${IMAGE}
# new_image=${MY_REGISTRY}/$(echo $IMAGE | awk -F'/' '{for(i=2;i<=NF;i++) printf "%s/", $i; print ""}' | sed 's/\/$//')
new_image=${MY_REGISTRY}/$(echo "${IMAGE}" | sed 's/mcr.microsoft.com/mcr/g' | sed 's/quay.io/quay/g')

echo "Tagging image: ${IMAGE}"
docker tag ${IMAGE}$new_image
echo "Pushing image: $new_image"
docker push $new_image
