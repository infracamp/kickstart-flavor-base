
# kickstart-flavor-base :: Base development container
[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Finfracamp%2Fkickstart-flavor-base%2Fbadge&style=flat)](https://actions-badge.atrox.dev/infracamp/kickstart-flavor-base/build-testing-daily)
[![Latest Stable Version](https://img.shields.io/github/release/infracamp/kickstart-flavor-base.svg)](https://github.com/infracamp/kickstart-flavor-base/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/infracamp/kickstart-flavor-base.svg)](https://github.com/infracamp/kickstart-flavor-base)
[![Docker Build status](https://img.shields.io/docker/cloud/build/infracamp/kickstart-flavor-base.svg)](https://cloud.docker.com/repository/docker/infracamp/kickstart-flavor-base/builds)
[![See Website](https://img.shields.io/badge/info-website-blue.svg)](http://infracamp.org/container)

see (http://github.com/infracamp/kickstart) for more information.

**This image is the base for many easy extensible containers**

Document Index:

- [Development Guide for this flavor](DEVELOPMENT.md)
- [Dockerhub page](https://hub.docker.com/r/infracamp/kickstart-flavor-base/)
    - [Tags available](https://hub.docker.com/r/infracamp/kickstart-flavor-base/tags/)
    - [Build details](https://hub.docker.com/r/infracamp/kickstart-flavor-base/builds/)



## Containers build on top of this container

- [kickstart-flavor-jekyll](https://github.com/infracamp/kickstart-flavor-jekyll)


## About this container

### Security Status

The containers software is checked for security updates twice a day.

You can trigger notifications loading our [security.json](https://raw.githubusercontent.com/infracamp/kickstart-flavor-base/master/sec_check/security.json).

### Default software

| Value            | Usage              | Docker-File ENV |
|------------------|--------------------|-----------------|
| Default-Encoding | UTF-8 (US)         |                 |
| Timezone         | Europe/Berlin      | `TIMEZONE=`     |
| Default-Editor   | vim                |                 |

### Usage

* **git**: Your git credentials and git-config is the same as your hosts
* **history**: Histroy is shared accross instances
* **bash completion**: Active by default
* **vim**: Editor for all questions

## Extending this container

Create a `Dockerfile`

```
FROM infracamp/kickstart-flavor-base:testing
LABEL maintainer="Matthias Leuffen <m@tth.es>"

ADD / /kickstart
RUN chmod -R 755 /kickstart && /kickstart/flavor/flavor-build.sh
```

Your project should look like

```
Dockerfile
flavor/
    flavor-build.sh
    prepare.start.d/
        01-prepare-whatever.sh
    start.d/
        01-start-whatever.sh
```
