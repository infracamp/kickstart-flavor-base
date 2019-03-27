# Developing this container

## Git submodules

```
git submodule update --init --recursive --remote
```

Do this before you push things. dockerhub will pull exacly the same
submodules version you have in this repository.


## Build & start the image locally

go to `test/01-devmode` and execute `./kickstart.sh`

It will build and run the image.


## Dockerhub integration

- The docker-service must be added to group-repository by hand
  by the user of the automated build.
  
In docker there should be following build-settings:

| Type   | Name          | Dockerfile Location | Docker Tag name |
|--------|---------------|---------------------|-----------------|
| Branch | master        | /                   | testing         |
| Tag    | `/^[0-9.]+$/` | /                   | latest          |
| Tag    | `/^[0-9.]+$/` | /                   | {sourceref}     |