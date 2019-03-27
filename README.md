
# kickstart-flavor base :: Base development container

see (http://github.com/infracamp/kickstart) for more information.

Document Index:

- [Development Guide for this flavor](DEVELOPMENT.md)
- [Dockerhub page](https://hub.docker.com/r/infracamp/kickstart-flavor-base/)
    - [Tags available](https://hub.docker.com/r/infracamp/kickstart-flavor-base/tags/)
    - [Build details](https://hub.docker.com/r/infracamp/kickstart-flavor-base/builds/)


## Container specific `.kick.yml`-directives

| Key | Default | Description |
|----------------|----------------|---------------------|
|

## Installed Software


## Extending this container

Create a `Dockerfile`

```
FROM infracamp/kickstart-flavor-base:testing
LABEL maintainer="Matthias Leuffen <m@tth.es>"

ADD / /kickstart

RUN chmod -R 755 /kickstart && /kickstart/flavor/flavor-build.sh && rm -R /var/lib/apt/lists

```
