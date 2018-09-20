#!/usr/bin/env bash

echo Enter the name of the playlist to save to:

read name

sed "s/PLAYLIST_NAME/${name}/g" YTPlaylistHelper.applescript > YTPlaylistHelper_"${name// /_}".applescript
