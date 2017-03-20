#!/bin/bash

# generate angular-cli.json
rm -rf .angular-cli.json
envsubst '${PROJECT_NAME}' <.angular-cli.tpl.json >.angular-cli.json

# generate package.json
rm -rf package.json
envsubst '${PROJECT_NAME} ${PROJECT_VERSION} ${DOMAIN_DEV}' <package.tpl.json >package.json

# generate docker-compose.yml
rm -rf docker-compose.yml
envsubst '${PROJECT_NAME} ${DOCKER_IMAGE_DEV} ${DOMAIN_DEV}' <docker-compose.tpl.yml >docker-compose.yml

# generate docker-compose.prod.yml
rm -rf docker-compose.prod.yml
envsubst '${PROJECT_NAME} ${DOCKER_IMAGE_PROD} ${DOMAIN_PROD}' <docker-compose.prod.tpl.yml >docker-compose.prod.yml
