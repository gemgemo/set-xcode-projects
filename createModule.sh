#!/bin/bash
red="\033[31m"
green='\033[0;32m'
yellow='\033[0;33m'
color_off='\033[0m'

proj_dir=$(pwd)
project_name=${proj_dir##*/}
project_container_dir="$(pwd)/${project_name}"
xcode_proj="${proj_dir}/${project_name}.xcodeproj"
modules_dir="${project_container_dir}/Modules"
if test -d $xcode_proj
then
  [ ! -d $modules_dir ] && mkdir -p modules_dir || echo -e $yellow "${modules_dir##*/} directory already Exist."
  echo -e $color_off
else
   echo -e $red "Invalid xcode project."
   exit 12
fi
module_dir="$modules_dir/$1"
if test ! -d $module_dir
    then
        mkdir -p $module_dir
    else
         echo -e $yellow "${module_dir##*/} module exist."
         exit 23
         #echo -e $color_off "If you want to create files enter y or to cancel enter n."
         #read cml
         #if [ $cml == "n" ]
            #then
                #exit 23
         #fi
fi

if [ $1 ]
then
  ext=".swift"
  router="Router"
  configurator="Configurator"
  controller="Controller"
  mediator="Mediator"
  worker="Worker"
  presenter="Presenter"

  routerFile="${module_dir}/${1}$router${ext}"
  controllerFile="${module_dir}/${1}$controller${ext}"
  configuratorFile="${module_dir}/${1}$configurator${ext}"
  mediatorFile="${module_dir}/${1}$mediator${ext}"
  workerFile="${module_dir}/${1}$worker${ext}"
  presenterFile="${module_dir}/${1}$presenter${ext}"

  for file in $controllerFile $routerFile $configuratorFile $mediatorFile $workerFile $presenterFile
  do
    touch $file
    filename=${file##*/}
    [ $file ] && echo -e "//\n// $filename\n// Created by $(whoami) on $(date +"%d/%m/%Y"). \n//\n// Copyright © $(date +"%Y") $(whoami). All rights reserved.\n//\n\n\nimport Foundation" >> $file || echo "$file file not found."
  done

  controllerContent="import UIKit\n\n
  internal final class ${1}${controller}: UIViewController, ${controller}\n
  {\n
    \n
  }\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n
  "
  echo -e $controllerContent >> $controllerFile

  routerContent="\n\n
  internal final class ${1}${router}: ${router}\n
  {\n
    \n
  }\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n
  "
  echo -e $routerContent >> $routerFile

  configuratorContent="\n\n
  internal final class ${1}${configurator}: ${configurator}\n
  {\n
    \n
  }\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n
  "
  echo -e $configuratorContent >> $configuratorFile

  mediatorContent="\n\n
  internal final class ${1}${mediator}: ${mediator}\n
  {\n
    \n
  }\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n
  "
  echo -e $mediatorContent >> $mediatorFile

  workerContent="\n\n
  internal final class ${1}${worker}: ${worker}\n
  {\n
    \n
  }\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n
  "
  echo -e $workerContent >> $workerFile

  presenterContent="
import UIKit\n\n
internal final class ${1}${presenter}: ${presenter}\n
{\n
    \n
}\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n
  "
  echo -e $presenterContent >> $presenterFile
  echo -e $green "${1} Module created successfully."
else
    echo -e $red "Invalid module name."
fi


# COMMENT
