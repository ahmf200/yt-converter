#!/bin/bash

zenityResult=$(
    zenity --height="200" --width="400" --list --title="YouTube Video Conversion" --column="Select either a single or playlist of videos to convert" \
    "Single YouTube Video" \
    "YouTube Video Playlist" \
)

if [ "$zenityResult" == "Single YouTube Video" ]; then
    echo "WELL DONE" 
    singleDownloadFormat=$(
    zenity --height="200" --width="400" --list --title="Single Video Conversion" --column="Which format do you want your single video to convert to?" \
    "MP3" \
    "MP4" \
    )
    if [ "$singleDownloadFormat" == "MP3" ]; then
        echo "MP3 SELECTED" &
        if videoId=$(zenity --height="200" --width="400" --entry)
        then
            youtube-dl -x -f 251 --audio-format mp3 "$videoId"
        fi
    elif [ "$singleDownloadFormat" == "MP4" ]; then
        echo "MP4 SELECTED" &
        if videoId=$(zenity --height="200" --width="400" --entry)
        then
            youtube-dl -f mp4 "$videoId"
        fi
    fi
elif [ "$zenityResult" == "YouTube Video Playlist" ]; then
    echo "Playlist selected" &
    playlistDownloadFormat=$(
    zenity --height="200" --width="400" --list --title="Playlist Video Conversion" --column="Which format do you want your playlist of videos to convert to?" \
    "MP3" \
    "MP4" \
    )
    if [ "$playlistDownloadFormat" == "MP3" ]; then
        echo "MP3 SELECTED" &
        if videoId=$(zenity --height="200" --width="400" --entry)
        then
            youtube-dl -x -f 251 --audio-format mp3 "$videoId"
        fi
    elif [ "$playlistDownloadFormat" == "MP4" ]; then
        echo "MP4 SELECTED" &
        if videoId=$(zenity --height="200" --width="400" --entry)
        then
            youtube-dl -f mp4 "$videoId"
        fi
    fi
fi
