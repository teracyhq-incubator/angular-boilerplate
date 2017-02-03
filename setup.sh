#!/bin/bash

set -a
source .env

# generate package.json
rm -rf package.json
cat package.tpl.json | envsubst > package.json

# generate docker-compose.yml
rm -rf docker-compose.yml
cat docker-compose.tpl.yml | envsubst > docker-compose.yml

# generate docker-compose.prod.yml
rm -rf docker-compose.prod.yml
cat docker-compose.prod.tpl.yml | envsubst > docker-compose.prod.yml
