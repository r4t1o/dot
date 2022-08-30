#!/bin/bash
script_name=${BASH_SOURCE[0]}
for pid in $(pidof -x $script_name); do
    if [ $pid != $$ ]; then
        kill -9 $pid
    fi 
done

set -e
output="/tmp/pscircle.png"
pscircle --output=$output \
	--background-color=101115 \
	--link-color-min=72869Ea0 \
	--link-color-max=75879d \
	--dot-color-min=cc283f \
	--dot-color-max=ff7c36 \
	--dot-radius=2 		\
	--tree-font-size=10 \
	--tree-font-color=75879d \
	--tree-font-face="Inter" \
	--toplists-row-height=30 \
	--toplists-font-size=15 \
	--toplists-font-color=75879d \
	--toplists-pid-font-color=7B9098 \
	--toplists-font-face="Inter" \
	--toplists-bar-height=7 \
	--toplists-bar-background=75879d \
	--toplists-bar-color=64282f

if command -v feh >/dev/null; then
	for pid in $(pidof -x swaybg); do
    if [ $pid != $$ ]; then
        kill -9 $pid
    fi 
done
	swaybg -m fill -i $output
	rm $output
fi


