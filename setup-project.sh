#!/usr/bin/env bash

# Constants
red="\033[31m"
green='\033[0;32m'
yellow='\033[0;33m'
color_off='\033[0m'

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

  # Create files => public title
  # vip protocols -> Controller-configurator-mediator-presenter-model-router create protocols file and write protocols in it.
  echo -e $color_off
  common_dir="${project_dir_path}/Common"
  protocols_swift_file="${common_dir}/Protocols${swift_ext}"
  test ! -f $protocols_swift_file && touch $protocols_swift_file || echo -e $yellow "${protocols_swift_file##*/} Exist."
  echo -e $color_off
  # Write protocols header
  if [ -f $protocols_swift_file ]
  then
   echo -e "//\n// ${protocols_swift_file##*/}\n// Created by $(whoami) on $(date +"%d/%m/%Y"). \n//\n// Copyright © $(date +"%Y") $(whoami). All rights reserved.\n//\n\n\nimport Foundation\n\n\n" > $protocols_swift_file
   echo -e "//#: VIP Design pattern blueprint\n\nprotocol Controller: class { }\nprotocol Model { }\nprotocol Mediator: class { }\nprotocol Configurator: class { }\nprotocol Worker: class { }\nprotocol Presenter: class { }\nprotocol Router: class { }" >> $protocols_swift_file
   echo -e "\n\n// MARK: - Naming
protocol Naming { }
extension Naming {
    func name(of className: AnyClass) -> String {
         return String.init(describing: className)
    }
}" >> $protocols_swift_file
  else
    echo -e $red "${protocols_swift_file##*/} file not found."
  fi

  # app module files
  #appModule="$project_dir_path/Modules/App"
  #test ! -d $appModule && mkdir -p $appModule || echo -e $yellow "${appModule##*/} Module Created in advance."
  _bash_project_path_=${0%/*}
  create_module_script="${_bash_project_path_}/createModule.sh App"
  . $create_module_script


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
