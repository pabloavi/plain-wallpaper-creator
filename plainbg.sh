#!/bin/bash
readarray -t colors < ./colors.txt

rm -r ./wallpapers
mkdir ./wallpapers
cp ./plain-backgroundsaved.svg ./plain-background.svg

j=0
for i in "${colors[@]}"
do
sed -i "s/#000000/$i/" plain-background.svg >plain-background2.svg
inkscape --export-type=png --export-filename=./wallpapers/color"$j".png -w 1920 -h 1080 ./plain-background.svg
j=$((j+1))
sed -i "s/$i/#000000/" plain-background.svg >plain-background2.svg
done

msg="Finalizado. Fondos creados en ./wallpapers"
echo "$msg"
notify-send "$msg"

rm plain-background2.svg
