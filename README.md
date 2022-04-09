# aliyun-oss-private-website

Though Aliyun [OSS](https://www.alibabacloud.com/help/en/object-storage-service) provides a [static website hosting](https://www.alibabacloud.com/help/en/object-storage-service/latest/static-website-hosting-overview) solution, you need to set you objects as [public-read](https://www.alibabacloud.com/help/en/object-storage-service/latest/bucket-acl). Sometimes for cyber security reasons, a static website only available to enterprise private network is preferred.

This solution demonstrates how to create a **static website for private network access** on top of an Aliyun **private OSS bucket** using [*rclone*](https://rclone.org/). Checkout `private-website-docker.bash` as an example. For production environment, it's advised to use a Kubernetes to host the *rclone* daemon.

![diagram](https://processon.com/chart_image/6251a02263768946f27924a4.png?_)
