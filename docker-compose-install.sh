#!/bin/bash
set -x

# This script with documentation is available at: https://gist.github.com/blazewicz/04e666ae1f25387c8b291d81b12c550c

## 1. install required dependencies with apt
apt update && apt install python3-venv python3-dev libffi-dev libssl-dev

## 2. create directory for docker-compose's virtualenv
mkdir -p /opt/local/docker-compose

## 3. create virtualenv in which we will install docker-compose
python3 -m venv /opt/local/docker-compose/venv

## 4. install docker-compose, this may take some time becase some dependecies has to be compiled
/opt/local/docker-compose/venv/bin/pip install --upgrade pip
/opt/local/docker-compose/venv/bin/pip install docker-compose

## 5. create a symlink so our fresh docker-compose is available in the $PATH
ln -s /opt/local/docker-compose/venv/bin/docker-compose /usr/local/bin/docker-compose
