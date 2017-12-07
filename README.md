# Installing Extensions

See here for installing more extensions <https://github.com/docker-library/docs/tree/master/php#how-to-install-more-php-extensions>

# Image Annottions

<https://github.com/opencontainers/image-spec/blob/master/annotations.md#pre-defined-annotation-keys>

## Extracting LABEL metadata with JQ

```sh
docker inspect ${my_container} | jq -r '.[0].Config.Labels["io.damacus.created"]'
```

# Building

```sh
source .docker/functions.sh
build
```
