#!/bin/bash
# Usage: ./enhance_video.sh video.mp4 [file_path] 24 [frame_rate] baseball [video_name]
echo "This script should be called on the original video."
cd enhancer/
echo "Extracting: $1";
rm -r datasets/video/*
rm -r datasets/final_results/*
mkdir datasets/video
ffmpeg -i ../$1  datasets/video/%03d.png
echo "Enhancing..."
python inference/inference_dfdnet.py --upscale_factor 1 --test_path datasets/video/ --official_adaption True
echo "Created video/final_results"
ffmpeg -i video/final_results/%03d.jpg -framerate $2 enhanced_video.mp4
mv enhanced_video.mp4 ../enhanced_videos/$3.mp4
echo "Created enhaced_videos/$3.mp4"

