#!/usr/bin/env bash

#This script is designed to convert large .mov files to slightly lower quality, but radically smaller .mp4 files
#file of absolute video file locations
#requires ffmpeg, can be installed with brew install ffmpeg
input="./filenames.txt"
while IFS= read -r line
do
  echo "processing file named: $line"

  #convert
  mp4name=${line%.*}.mp4
  ffmpeg -i "$line" -threads 1 -vcodec h264 -preset:v ultrafast -acodec copy -crf 18 -filter:v scale="trunc(oh*a*2)/2:720" "$mp4name" < /dev/null

  #rm "$line"
done < "$input"