#!/bin/bash

gnome-screenshot -w -f ~/Pictures/TempScreen/image.png

image="/home/zoc/Pictures/TempScreen/image.png"
newimage="/home/zoc/Pictures/TempScreen/newimage.png"

original_width=$(identify -format "%w" $image)
original_height=$(identify -format "%h" $image)

convert -size ${original_width}x${original_height} xc:none -draw "roundrectangle 0,0,${original_width},${original_height},15,15" mask.png
convert $image -matte mask.png -compose DstIn -composite $image
convert "$image" \( +clone -background black -shadow 32x24+0+13 \) +swap -background transparent -layers merge +repage "$image"

xclip -selection clipboard -t image/png -f "$image"

rm $image $newimage
