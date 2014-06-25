#!/bin/bash


function draw_horiz_line(){
echo -n "+"
for (( i=2 ; i <$1 ; i++ ))
do
  echo -n "-"
done
echo "+"
}

function draw_center_text(){
echo -n "|"
length=${#1}
spc_bfore=`expr \`expr $2 / 2\` - \`expr $length / 2\``
spc_after=`expr $2 - \`expr $spc_bfore + 2 + $length\``
for (( i=1 ; i <=$spc_bfore ; i++ ))
do
  echo -n " "
done
echo -n "$1"
for (( i=1 ; i <=$spc_after ; i++ ))
do
  echo -n " "
done
echo "|"
}

function draw_left_text(){
echo -n "| "
length=${#1}
spc_after=`expr $2 - \`expr 3 + $length\``
echo -n "$1"
for (( i=1 ; i <=$spc_after ; i++ ))
do
  echo -n " "
done
echo "|"
}

function menu(){
cols=$(tput cols)
lines=$(tput lines)
# first line, a complete one
draw_horiz_line $cols
draw_center_text "$1" $cols
draw_horiz_line $cols
draw_center_text "" $cols
draw_center_text "Me cago en la madre que pario a paneque" $cols
draw_left_text "sips" $cols
draw_center_text "" $cols
draw_horiz_line $cols

}

title="This is a test title"
menu "$title"
