## BUILDING
##   (from project root directory)
##   $ docker build -t ubuntu-for-bitnami-bitnami-docker-mariadb .
##
## RUNNING
##   $ docker run ubuntu-for-bitnami-bitnami-docker-mariadb

FROM gcr.io/stacksmith-images/ubuntu:14.04-r9

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="3ziu7db" \
    STACKSMITH_STACK_NAME="Ubuntu for bitnami/bitnami-docker-mariadb" \
    STACKSMITH_STACK_PRIVATE="1"

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating


ENV BITNAMI_IMAGE_VERSION=10.1.14-r4 \
    BITNAMI_APP_NAME=mariadb \
    BITNAMI_APP_USER=mysql

RUN bitnami-pkg unpack mariadb-10.1.14-4 --checksum 4a75f4f52587853d69860662626c64a4540126962cd9ee9722af58a3e7cfa01b
ENV PATH=/opt/bitnami/$BITNAMI_APP_NAME/sbin:/opt/bitnami/$BITNAMI_APP_NAME/bin:$PATH

COPY rootfs/ /
ENTRYPOINT ["/app-entrypoint.sh"]
CMD ["nami", "start", "--foreground", "mariadb"]

VOLUME ["/bitnami/$BITNAMI_APP_NAME"]

EXPOSE 3306
