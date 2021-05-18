#!/bin/bash
# johanc@mit.edu
# Usage: ./colorize_video.sh video.mp4 [filepath] baseball [file name (no ext)]

echo "Preprocessing $1..."
# Weird errors if the file is no
rm -r colorizer/video
mkdir colorizer/video
mkdir colorizer/video/source
cp $1 colorizer/video/source/$1
cd colorizer/ # Need to cd so fastai has the correct relative path.
echo "Colorizing $1..."
python3 colorize.py --video_path $1
cp video/result/$1 ../$2.mp4
echo "Created $2"
cd ..