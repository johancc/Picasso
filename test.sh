name=$1
height=$(ffmpeg -i $name.mp4 2>&1 | grep Video: | grep -Po '\d{3,5}x\d{3,5}' | cut -d'x' -f1)
# height=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 $name.mp4 | cut -d'x' -f1)
width=$(ffmpeg -i $name.mp4 2>&1 | grep Video: | grep -Po '\d{3,5}x\d{3,5}' | cut -d'x' -f2)
# width=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 $name.mp4 | cut -d'x' -f2)
echo "Height is $height and width is $width"