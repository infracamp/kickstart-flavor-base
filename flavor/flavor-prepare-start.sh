#!/bin/bash

## This script is executed when the container starts up

for file in /kickstart/flavor/prepare.start.d/*
do
    echo "Executing file /kickstart/flavor/prepare.start.d/$file"
    . /kickstart/flavor/prepare.start.d/$file
done