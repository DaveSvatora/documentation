# documentation
My personal documentation site

## Local

> RUN

```docker
docker run --rm -it -p 80:8000 -v ${PWD}:/docs squidfunk/mkdocs-material
```

<a href="localhost" target="_blank">localhost</a>

> BUILD

```docker
docker run --rm -it -v ${PWD}:/docs squidfunk/mkdocs-material build
```

## Deploying

```sh
./deploy.sh
```