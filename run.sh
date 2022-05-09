#!/bin/bash

docker run -ti -p 5900:5900 -p 8080:8080 --device /dev/dri --name novnc --rm kmr/novnc:latest
