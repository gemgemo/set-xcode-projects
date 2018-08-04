#!/usr/bin/env bash

# Constants
red="\033[31m"
green='\033[0;32m'
yellow='\033[0;33m'
collor_of='\033[0m'

#1. Check if a valid xcode project
dir_path=$(pwd)
proj_name=${dir_path##*/}
project_dir_path="$dir_path/$proj_name"
swift_ext=".swift"
echo Project path is: $dir_path
echo Project name is: $proj_name
echo Main Directory is: $project_dir_path

if [ -d *.xcodeproj ]
then
  echo -e $green "Valid XCode project."
  if [ -d $project_dir_path ]
  then

    # Remove generic view controller
    generic_view_controller_path="$project_dir_path/ViewController$swift_ext"
    if [ -f $generic_view_controller_path ]
    then
      rm $generic_view_controller_path
      echo -e $green "$generic_view_controller_path Deleted."
    else
       echo -e $yellow "${generic_view_controller_path##*/} Deleted in advance."
    fi

    # Create Main directories
    # loop an array of main dirs and create them.
  for dir in Storyboards UIControls Modules Extensions Resources Common
  do
    target_dir_path="$project_dir_path/$dir"
    # echo $target_dir_path
    test ! -d $target_dir_path && mkdir -p $target_dir_path || echo -e $yellow "${target_dir_path##*/} Directory Exist."
  done

  # Create sub directories
  cells_dir="$project_dir_path/UIControls/Cells"
  [ ! -d $cells_dir ] && mkdir -p $cells_dir || echo -e $yellow "${cells_dir##*/} Created in advance."
  appModule="$project_dir_path/Modules/App"
  test ! -d $appModule && mmkdir -p $appModule || echo -e $yellow "${appModule##*/} Created in advance."
  # Create files
  # app module files
  # vip protocols
  else
    echo -e $red "Not Found xcode project main directory."
  fi
else
  echo -e $red "Invalid xcode project."
fi




<<COMMENTS
 - VIP design pattern -
get project directory project
check if valid project
remove generic view controller
create main dirs
create common files - protocols -
create run file: run any command created
COMMENTS>>
