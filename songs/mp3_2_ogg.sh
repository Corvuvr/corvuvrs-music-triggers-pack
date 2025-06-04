#!/bin/bash

find . -name "*.mp3" | while read filename ; do
   new_filename="${filename:2}"
   new_filename="${new_filename//".mp3"/""}"
   new_filename="${new_filename//".ogg"/""}"
   new_filename="${new_filename//"["/""}"
   new_filename="${new_filename//"]"/""}"
   new_filename="${new_filename//"("/""}"
   new_filename="${new_filename//")"/""}"
   new_filename="${new_filename//"!"/""}"
   new_filename="${new_filename//"-"/"_"}"
   new_filename="${new_filename//"–"/"_"}"
   new_filename="${new_filename//"&"/"_"}"
   new_filename="${new_filename//" "/"_"}"
   new_filename="${new_filename//"___"/"_"}"
   new_filename="${new_filename//"__"/"_"}"
   new_filename=$new_filename.ogg
   < /dev/null ffmpeg -i "${filename:2}" -vn -f ogg $new_filename
done

