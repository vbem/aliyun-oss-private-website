#!/usr/bin/env bash
# To create a static website for private network access on top of an Aliyun private OSS bucket.
# https://github.com/vbem/aliyun-oss-private-website

AWS_ACCESS_KEY_ID="AK of your service account RAM identity"
AWS_SECRET_ACCESS_KEY="SK of your service account RAM identity"
OSS_WEB_TZ="Asia/Shanghai"
OSS_WEB_ENDPOINT="oss-cn-shanghai-internal.aliyuncs.com" # https://help.aliyun.com/document_detail/31837.html
OSS_WEB_BUCKET="your OSS bucket name"
OSS_WEB_PORT="80"

docker run --name "$OSS_WEB_BUCKET" \
  --detach --restart always \
  -p "$OSS_WEB_PORT:80" \
  -e TZ="$OSS_WEB_TZ" -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY \
  rclone/rclone:latest serve http -v --stats=0 --addr=:80 --dir-cache-time=1m \
    ":s3,provider=Alibaba,env_auth,endpoint=$OSS_WEB_ENDPOINT:$OSS_WEB_BUCKET"
