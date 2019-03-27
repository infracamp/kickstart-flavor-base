#!/bin/bash

## This script is executed when the container starts up

for file in /kickstart/flavor/start.d/*.sh
do
    echo "Executing file  $file"
    . $file
done