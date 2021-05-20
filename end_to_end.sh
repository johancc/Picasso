#!/bin/bash 
# ralcanta@mit.edu
# should be called as ./end_to_end.sh filename (without ext.). It is assumed there exist videos/filename.mp4

echo "Starting..."
videoName=$1 #Should be in videos/ directory
echo "Processing video $videoName"

echo "STEP 1: ENHANCING"
cp videos/$videoName.mp4 $videoName.mp4
./enhance_video.sh $videoName.mp4 24 
enhanced_name=""$videoName"_enhanced"

echo "STEP 2: COLORIZATION"
colorized_name=""$enhanced_name"_colorized"
cp enhanced_videos/$enhanced_name.mp4 $enhanced_name.mp4
./colorize_video.sh $enhanced_name.mp4 $colorized_name 

echo "STEP 3: DENOISING"
echo "Original video and colorized video should be of the same shape. Resizing the colorized version to fit the original..."
height=$(ffmpeg -i $videoName.mp4 2>&1 | grep Video: | grep -Po '\d{3,5}x\d{3,5}' | cut -d'x' -f1)
width=$(ffmpeg -i $videoName.mp4 2>&1 | grep Video: | grep -Po '\d{3,5}x\d{3,5}' | cut -d'x' -f2)
echo "Original video has size "$width"x"$height""
ffmpeg -i $colorized_name.mp4 -vf scale="$height:$width" "$colorized_name"_scaled.mp4 #Unsure why is height:width and not widht:height
echo ""$colorized_name" scaled!"
./denoise_video.sh $videoName.mp4 "$colorized_name"_scaled.mp4 24
denoised_name=""$colorized_name"_scaled_denoised"
cp $denoised_name.mp4 final_results/$denoised_name.mp4 
echo "Finished. Yay!"
echo "You can find the final results in final_results/"$denoised_name".mp4"