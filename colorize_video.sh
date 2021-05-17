#!/bin/bash

echo "Colorizing $1"
COLORIZED_VIDEO = $(python colorizer/colorize.py --video_path $1)
echo "Created ${COLORIZED_VIDEO}"
