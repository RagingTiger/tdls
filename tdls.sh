#!/usr/bin/env bash

# globals
todolist=".todolist"
help_doc="
Usage:
    tdls                 Simply prints out todolist of working directory
    tdls rm              Removes entire todolist file
    tdls ed              Opens todolist file in nano editor
    tdls add <entry>     Adds new entry to todolist
    tdls read            Allows for scrollable reading of todolist
    tdls help            Prints out this help doc"

# functions
print_help () {
  echo "$help_doc"
}

print_todolist() {
  # check for .todolist
  if exists; then
    cat "$1"
  else
    # create new todolist?
    create_todolist
  fi
}

exists() {
  if [ -e "$todolist" ]; then
    return 0
  else
    return 1
  fi
}

edit_todolist() {
  if exists; then
    nano $todolist
  else
    create_todolist
  fi
}

read_todolist() {
  if exists; then
    less $todolist
  else
    create_todolist
  fi
}

remove_todolist() {
  if exists; then
    # get answer
    answer=
    echo -n "Delete todolist?[y|n]: "
    read answer

    # check answer
    case $answer in
      "yes") rm $todolist;;
      "y") rm $todolist;;
    esac
  else
    :
  fi
}

addto_todolist() {
  if [[ -z "$@" ]]; then
    echo "Must provide text to write"
  else
    if exists; then
      shift
      echo "$@" >> $todolist
    else
      create_todolist $@
    fi
  fi
}

template_todolist() {
  # create empty todolist
  touch $todolist
  echo "ToDoList:" >> $todolist

  # check for add
  if [ -z "$1" ]; then
    :
  else
    addto_todolist $@
  fi

  # ask about editing
  echo -n "Would you like to open and start editing new todolist?[y|n]: "
  read answer

  # check answer
  case $answer in
    "yes") edit_todolist;;
    "y") edit_todolist;;
  esac
}

create_todolist() {
  # create new todolist?
  answer=
  echo -n "No todolist found. Create one?[y|n]: "
  read answer

  # check answer
  case $answer in
    "yes") template_todolist $@;;
    "y") template_todolist $@;;
  esac
}


# run main
if [ -z "$1" ]; then
  # cat
  print_todolist $todolist

else
  # check args
  case $1 in
    "add") addto_todolist $@;;
    "-a") addto_todolist $@;;
    "ed") edit_todolist;;
    "-e") edit_todolist;;
    "rm") remove_todolist;;
    "-r") remove_todolist;;
    "read") read_todolist;;
    "-rd") read_todolist;;
    "help") print_help;;
    "-h") print_help;;
  esac
fi
