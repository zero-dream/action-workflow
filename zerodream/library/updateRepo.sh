#!/bin/bash
# Copyright (C) 2000 ZeroDream
# https://github.com/zero-dream

# --------------------------------------------------

# Tip: It will disrupt the Workflow initialization and execute at the end of the steps

# --------------------------------------------------

# Source
source "$ZD_LibPath/gitPush.sh"

# --------------------------------------------------

# Private
__ZeroRepoPath="$RUNNER_TEMP/__ZeroRepo-$(uuidgen | tr -d '-')"

# --------------------------------------------------

# CloneRepo
# echo path
function cloneRepo() {
  # CloneRepo
  git clone --depth=1 https://github.com/$GITHUB_REPOSITORY.git "$__ZeroRepoPath/" || exit 1 # Exit
  # HandleGitDir
  rm -rf "$__ZeroRepoPath/.git/"
  cp -a "$GITHUB_WORKSPACE/.git/" "$__ZeroRepoPath/"
  # Return
  echo "$__ZeroRepoPath"
  return 0
}

# PushRepo
# $1 commit
function pushRepo() {
  # Param
  local commit=$1

  # KeepDirArr
  initCfgPath="$ZD_ConfigPath/init.json5"
  initCfgJson=$(json5 "$initCfgPath")
  echo "$initCfgJson" | jq -r '.keepDirArr[]' | while read keepDir; do
    mkdir -p "$__ZeroRepoPath/zerodream/$keepDir/"
    find "$__ZeroRepoPath/zerodream/$keepDir/" -mindepth 1 -delete
    cp -a "$ZD_RootPath/$keepDir/." "$__ZeroRepoPath/zerodream/$keepDir/"
  done

  # MergeRepo
  find "$GITHUB_WORKSPACE/" -mindepth 1 -delete
  cp -a "$__ZeroRepoPath/." "$GITHUB_WORKSPACE/"
  # GitPush
  gitPush "$GITHUB_REF" "$commit"
  # DeleteRepo
  rm -rf "$__ZeroRepoPath/"
  # Return
  return 0
}
