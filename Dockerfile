FROM ubuntu:18.04
LABEL   maintainer="Matthias Leuffen <m@tth.es>" \
        org.infracamp.flavor.tag="${DOCKER_TAG}" \
        org.infracamp.flavor.name="${IMAGE_NAME}"\
        org.infracamp.flavor.vulnerable_check_url="https://github.com/infracamp/kickstart-flavor-base/blob/master/security/vul/kickstart-flavor-base-release-${DOCKER_TAG}.txt"

ADD / /kickstart
RUN chmod -R 755 /kickstart && env && /kickstart/flavorkit/template/base-install-ubuntu.sh && /kickstart/flavorkit/scripts/build.sh && /kickstart/flavor/flavor-build.sh


ENV TIMEZONE Europe/Berlin
ENV KICKSTART_HYPERVISE_HOST="http://kickstart-hypervise/"

ENV DEV_MODE "0"
ENV DEV_CONTAINER_NAME "unnamed"
ENV DEV_UID "1000"
ENV DEV_TTYID "xXx"

ENV CONF_DUMMY_VALUE "TEST CONFIG VALUE"

# Set from hub.docker.com
ENV IMAGE_NAME "${IMAGE_NAME}"

# Use for debugging:
#ENTRYPOINT ["/bin/bash"]


ENTRYPOINT ["/kickstart/flavorkit/scripts/start.sh"]
