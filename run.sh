#!/usr/bin/env bash
red="\033[31m"
# main function
project_path=${0%/*}
function vip() {
  #if [ $# < 3 ]
    #then
      case $1 in
          "-c")
            if [ $# -eq 1 ]
              then
                # pass create project path to it
                prepare_project_file_path="${project_path}/setup-project.sh"
                # run script
                . $prepare_project_file_path
              else
                echo -e $red"Need one entry: '-c' to prepare project or '-m' {module-name} to create module."
            fi
         ;;
        "-m")
          if [ $2 ]
            then
              # pass create module path to it
              create_module_file_path="${project_path}/createModule.sh"
              # run script
              . $create_module_file_path $2
            else
              echo -e $red"Need one entry: '-c' to prepare project or '-m' {module-name} to create module."
          fi
        ;;
        *) echo -e $red"Need one entry: '-c' to prepare project or '-m' {module-name} to create module." ;;
      esac
  #   else
  #     echo -e $red"Need one entry: '-c' to prepare project or '-m' {module-name} to create module."
  # fi
}


# COMMENTS
# create install script
