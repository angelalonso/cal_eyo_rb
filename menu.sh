#!/bin/bash
#

options=( calendar backup battery system exit )
 
########
# Menu #
########
responseok="not"
while [ "$responseok" != "ok" ]; do
  clear
  echo "> Main"
  echo ".---- Control Center ----."
  echo " - Options:"
  echo
  cntr=1
  for i in ${options[@]}
  do
    echo $cntr - $i
    cntr=`expr $cntr + 1`
  done
  echo
  maxoption=`expr $cntr - 1`
  read -n 1 -s response
  if [ $response -ne 0 -o $response -eq 0 2>/dev/null ]; then
    if [ $response -eq 0 -o $response -gt $maxoption ]; then
      responseok="not"
      echo "ERROR! - invalid answer"
      echo "Please, enter a number that corresponds to one of the Options"
      sleep 1
    else
      responseok="ok"
    fi
  else
    responseok="not"
    echo "ERROR! - invalid answer"
    echo "Please, enter a number"
    sleep 1
  fi
done

case $response in
  1)
   echo elegida la primera 
   sleep 1;;
  2) 
   echo elegida la segunda 
   sleep 1;;
  3)
   echo elegida la tercera 
   sleep 1;;
  4)
   echo elegida la cuarta
   sleep 1;;
  5)
   echo BYE !!
   sleep 1;;
esac
