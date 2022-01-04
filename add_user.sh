#!/bin/bash

docker-compose exec codimd ./bin/manage_users --add "$1"

