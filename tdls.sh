#!/usr/bin/env bash

# globals
cmdname="tdls"
file="$PWD/.todolist"
HEADER="ToDoList:"

# library
source $SHELLLIB/filemanage.sh

# run main
main $1 $@
