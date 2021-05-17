#!/bin/bash 

echo "Picasso 🖌️ "
echo "Setting up Picasso. This will take a while ⏱️"

# # Denoiser

# echo "Setting up denoiser..."
# conda env update --file denoiser/environment.yml
# echo "Denoiser installed succesfully."
# cd ../

# # Enhancer 

# echo "Setting up enhancer..."
cd enhancer/
echo "Installing requirements..."
# Install requirements
pip install -r requirements.txt
# https://github.com/davisking/dlib
pip install dlib
python setup.py develop
echo "Downloading models..."
rm -r experiments/*
python scripts/download_pretrained_models.py DFDNet
python scripts/download_pretrained_models.py dlib
echo "Enhancer installed successfully."
cd ../

# Colorizer 

echo "Setting up colorizer..."
cd colorizer
pip install -r requirements.txt
echo "Downloading models..."
mkdir "models"
wget https://data.deepai.org/deoldify/ColorizeVideo_gen.pth -O ./models/ColorizeVideo_gen.pth
wget https://media.githubusercontent.com/media/jantic/DeOldify/master/resource_images/watermark.png -O ./resource_images/watermark.png
echo "Colorizer installed succesfully."
cd ../

echo "Picasso has been installed."