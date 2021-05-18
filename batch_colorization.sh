#!/bin/bash
# johanc@mit.edu
# Usage: batch_colorization.sh video1.mp4 [path] video2.mp4  ...
# This script will colorize multiple videos. By default, the colorized videos will be placed in ./colorized_videos
# Note: Assumes all videos are 24 FPS!

for videoPath in "$@"
do 
    filename=""${videoPath%%.*}"_colorized"
    ./colorize_video.sh $videoPath $filename
done