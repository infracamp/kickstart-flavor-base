#!/bin/bash

## This script is executed when the container starts up

for file in /kickstart/flavor/start.d/*
do
    echo "Executing file /kickstart/flavor/start.d/$file"
    . /kickstart/flavor/start.d/$file
done