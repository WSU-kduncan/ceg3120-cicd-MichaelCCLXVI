#!/bin/bash

docker kill albright_image
docker rm albright_image
docker pull wsumalbright/albright-ceg3120:latest
docker run -d -p 4200:4200 --name albright_image --restart=always wsumalbright/albright-ceg3120:latest
