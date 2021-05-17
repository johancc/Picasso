#!/bin/bash 
echo "Setting up enhancer..."

cd enhancer/
echo "Installing requirements..."
# Install requirements
pip install -r requirements.txt
# https://github.com/davisking/dlib
pip install dlib
python setup.py develop
echo "Downloading models..."
python scripts/download_pretrained_models.py DFDNet
python scripts/download_pretrained_models.py dlib

echo "Enhancer installed successfully."
cd ../
echo "Setting up colorizer..."
cd colorizer
pip install -r requirements.txt
echo "Downloading models..."
mkdir 'models'
wget https://data.deepai.org/deoldify/ColorizeVideo_gen.pth -O ./models/ColorizeVideo_gen.pth
wget https://media.githubusercontent.com/media/jantic/DeOldify/master/resource_images/watermark.png -O ./resource_images/watermark.png

echo "Colorizer installed succesfully."
cd ../
echo "Setting up denoiser..."
cd denoiser/
conda env update -n base --file environment.yml
echo "Denoiser installed succesfully."
cd ../
