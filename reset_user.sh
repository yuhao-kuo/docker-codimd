#!/bin/bash

docker-compose exec codimd ./bin/manage_users --reset "$1"
