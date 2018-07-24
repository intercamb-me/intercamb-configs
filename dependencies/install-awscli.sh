#!/bin/bash

set -e

echo "Installing AWS client..."

curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py --user
rm get-pip.py
~/.local/bin/pip install awscli --upgrade --user

echo "AWS client was installed with success!"
