#!/bin/bash

docker build -t kmr/novnc:latest .
docker tag kmr/novnc:latest ghcr.io/km-robotics/novnc:latest
