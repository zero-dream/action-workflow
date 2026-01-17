#!/bin/bash
# Copyright (C) 2000 ZeroDream
# https://github.com/zero-dream

# --------------------------------------------------

# ReadConfig
# $1 name
# echo config
function readConfig() {
  # Param
  local name=$1
  # ReadConfig
  echo $(cat "$ZD_ConfigDataPath/$name")
  # Return
  return 0
}

# WriteConfig
# $1 name
# $2 config
function writeConfig() {
  # Param
  local name=$1
  local config=$2
  # WriteConfig
  echo "$config" >"$ZD_ConfigDataPath/$name"
  # Return
  return 0
}

# DeleteConfig
# $1 name
function deleteConfig() {
  # Param
  local name=$1
  # DeleteConfig
  rm "$ZD_ConfigDataPath/$name"
  # Return
  return 0
}
