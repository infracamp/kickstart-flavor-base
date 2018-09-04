#!/bin/bash

#
# This file is called from Kickstart to
# finalize the container installation
#

set -e



echo 'export LC_ALL=C.UTF-8' >> /home/user/.bashrc
echo 'export LANG=C.UTF-8' >> /home/user/.bashrc

