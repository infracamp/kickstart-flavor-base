#!/bin/bash

#
# This file is called from Kickstart to
# finalize the container installation
#

set -e

echo 'export LC_ALL=en_US.UTF-8' >> /home/user/.bashr
echo 'export LANG=en_US.UTF-8' >> /home/user/.bashrc
echo "export LANGUAGE=en_US.UTF-8" >> /home/user/.bashrc
