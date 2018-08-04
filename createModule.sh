#!/bin/bash

proj_dir=$(pwd)
project_name=${proj_dir##*/}
project_container_dir="$(pwd)/${project_name}"
xcode_proj="${proj_dir}/${project_name}.xcodeproj"
modules_dir="${project_container_dir}/Modules"
if test -d $xcode_proj
then
  [ ! -d $modules_dir ] && mkdir -p modules_dir || echo "$modules_dir Exist."
else
   echo "Invalid xcode project."
   exit 12
fi
module_dir="$modules_dir/$1"
test ! -d $module_dir && mkdir -p $module_dir || echo "$module_dir Exist."
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

  presenterContent="import UIKit\n\n
  internal final class ${1}${presenter}: ${presenter}\n
  {\n
    \n
  }\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n
  "
  echo -e $presenterContent >> $presenterFile

else
    echo "Invalid module name."
fi




<<COMMENT
//
//  CategoriesController.swift
//  jamaldemoarcoproject
//
//  Created by Jamal Alayeq on 7/27/18.
//  Copyright © 2018 Jamal Elayeq. All rights reserved.
//
COMMENT>>
