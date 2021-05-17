#!/bin/sh 
# Usage: enhance_frames.sh video.mp4
python inference/inference_dfdnet.py --upscale_factor 1 --test_path datasets/video/ --official_adaption True

echo "Extracting: $1";
rm -r datasets/video/*
rm -r datasets/final_results/*
mkdir datasets/video
ffmpeg -i $1  datasets/video/%03d.png
echo "Enhancing..."
python inference/inference_dfdnet.py --upscale_factor 1 --test_path datasets/video/ --official_adaption True
echo "Created video/final_results"
