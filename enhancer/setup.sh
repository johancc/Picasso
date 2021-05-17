#!/bin/bash
echo "Installing requirements..."
# Install requirements
pip install -r requirements.txt
# https://github.com/davisking/dlib
pip install dlib
python setup.py develop
echo "Downloading models..."
python scripts/download_pretrained_models.py DFDNet
python scripts/download_pretrained_models.py dlib
