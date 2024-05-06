#!/bin/bash
wallpapers=$HOME/dot/wallpapers
random=$(ls $wallpapers | shuf | head -1)
random=$wallpapers/$random

# split image
convert -crop 50%x100% $random /tmp/output.png

swww img -o "DP-2" --transition-type random /tmp/output-1.png
swww img -o "DP-3" --transition-type random /tmp/output-0.png
