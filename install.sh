#!/usr/bin/env bash

set -e

pyenv local 3.10.9

python -m venv .venv

# check if git bash
if [[ "$OSTYPE" == "msys" ]]; then
    source .venv/Scripts/activate
else
    source .venv/bin/activate	
fi

pip install --upgrade pip
pip install -e .
