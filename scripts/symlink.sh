#!/bin/bash

INPUT_DIR=$(dirname "$(dirname "$(readlink -f "$0")")")/.config

OUTPUT_DIR=$HOME/.config

SPECIAL_FILES=(".bashrc" ".zshrc" "justfile")

declare -A COLORS
COLORS[green]="\033[32m"
COLORS[magent]="\033[35m"
COLORS[red]="\033[31m"
COLORS[reset]="\033[0m"

if [ ! -d $INPUT_DIR ]; then
  echo "$INPUT_DIR doesn't exist"
  exit 1
fi

if [ ! -d $OUTPUT_DIR ]; then
  mkdir -p $OUTPUT_DIR
  echo "$OUTPUT_DIR created"
fi

for subentry in $INPUT_DIR/*; do
  if [ -d $subentry ] || [ -f $subentry ]; then
    subentry_name=$(basename $subentry)
    output_path=$OUTPUT_DIR/$subentry_name

    if [ -e $output_path ] || [ -L $output_path ]; then
      if [ -L $output_path ] && [ "$(readlink $output_path)" = "$subentry" ]; then
        echo -e "${COLORS[magent]}[OMITTING]${COLORS[reset]} $output_path is already a symlink of $subentry_name"
      else
        echo -e "${COLORS[red]}[EXCEPTION]${COLORS[reset]} $output_path is already configured"
        read -p "Do you want delete it and create a symbolic link to $subentry_name? (y/n): " ans
        if [ $ans = "y" ]; then
          rm -r $output_path
          ln -s $subentry $output_path
          echo -e "${COLORS[green]}[SUCCESS]${COLORS[reset]} $output_path overwritted with $subentry_name"
        fi
      fi
    else
      ln -s $subentry $output_path
      echo -e "${COLORS[green]}[SUCCESS]${COLORS[reset]} $output_path created"
    fi
  fi
done

for file in ${SPECIAL_FILES[@]}; do
  file_path=$(dirname "$(dirname "$(readlink -f "$0")")")/$file
  output_path=$HOME/$file
  if [ -f $file_path ]; then
    file_name=$(basename $file_path)
    if [ -e $output_path ] || [ -L $output_path ]; then
      if [ -L $output_path ] && [ "$(readlink $output_path)" = "$file_path" ]; then
        echo -e "${COLORS[magent]}[OMITTING]${COLORS[reset]} $output_path is already a symlink of $file_name"
      else
        echo -e "${COLORS[red]}[EXCEPTION]${COLORS[reset]} $output_path is already configured"
        read -p "Do you want delete it and create a symbolic link to $file? (y/n): " ans
        if [ $ans = "y" ]; then
          rm $output_path
          ln -s $file_path $output_path
          echo -e "${COLORS[green]}[SUCCESS]${COLORS[reset]} $output_path overwritted with $file_name"
        fi
      fi
    else
      ln -s $file_path $output_path
      echo -e "${COLORS[green]}[SUCESS]${COLORS[reset]} $output_path created"
    fi
  else
    echo "$file_path doesn't exist"
  fi
done
