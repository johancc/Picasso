#!/bin/bash 
# Denoises a given video using deep temporal denoising. 
# Usage: ./denoise_video.sh video_original.mp4 [file path] video_colorized.mp4 24 [frame rate]

echo "Source video: $1"
echo "Custom video: $2"
echo "Make sure $1 and $2 have the same resolution!"
originalVideoPath=$1
customVideoPath=$2
videoName=""${customVideoPath%%.*}"_denoised"

# Denoiser specific folders
cd denoiser 
rm -r input/*
rm -r output/*
rm -r result/*
mkdir input
mkdir input/processed
mkdir input/original 
mkdir output
cd .. 

echo "Preprocessing $1"
ffmpeg -i $originalVideoPath denoiser/input/original/%03d.png
ffmpeg -i $customVideoPath denoiser/input/processed/%03d.png 

cd denoiser 
rm -r colorization/*
python3 main_IRT_v2.py --max_epoch 25 --input input/original --with_IRT 0 --IRT_initialization 0 --save_freq 1 --processed input/processed --model colorization  --output ./result/colorization

ffmpeg -framerate $3 -i result/colorization/colorization_IRT1_initial1/original/0010/out_main_%05d.jpg ../$videoName.mp4

cd ..