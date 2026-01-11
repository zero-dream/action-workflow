#!/bin/bash
# Copyright (C) 2000 ZeroDream

# --------------------------------------------------

# Dependence

# Env
#   GITHUB_REF: ${{github.ref}}

# --------------------------------------------------

# Tip: It will disrupt the Workflow initialization and execute at the end of the steps

# --------------------------------------------------
# Source
source "$ZD_ScriptLibPath/gitPush.sh"

# --------------------------------------------------

# Private
__ZeroProjectPath="$RUNNER_TEMP/__ZeroUpdateProject-$(uuidgen | tr -d '-')"

# --------------------------------------------------

# CloneProject
# echo path
function cloneProject() {
  # CloneProject
  git clone --depth=1 https://github.com/$GITHUB_REPOSITORY.git "$__ZeroProjectPath/"
  # HandleGitDir
  rm -rf "$__ZeroProjectPath/.git/"
  cp -a "$GITHUB_WORKSPACE/.git/" "$__ZeroProjectPath/"
  # Echo
  echo "$__ZeroProjectPath"
  return 0
}

# PushProject
function pushProject() {
  # Param
  local commit=$1
  # MergeRepo
  find "$GITHUB_WORKSPACE/" -mindepth 1 -delete
  cp -a "$__ZeroProjectPath/." "$GITHUB_WORKSPACE/"
  # GitPush
  gitPush "$GITHUB_REF" "$commit"
  return 0
}
