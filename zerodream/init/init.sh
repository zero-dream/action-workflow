#!/bin/bash
# Copyright (C) 2000 ZeroDream
# https://github.com/zero-dream

# --------------------------------------------------

# ScriptDir
__ScriptDir=$(dirname "${BASH_SOURCE[0]}")

# CheckScript
find "$__ScriptDir/" -type f \
  -exec chmod +x {} \;

# Source
chmod +x "$__ScriptDir/../library/script/setEnv.sh"
source "$__ScriptDir/../library/script/setEnv.sh"

# --------------------------------------------------

# ZeroDreamEnv
setEnv 'ZD_Owner' 'zero-dream'
setEnv 'ZD_DATE' "$(TZ=UTC date '+%y%m%d%H%M%S')"
setEnv 'ZD_RootPath' "$GITHUB_WORKSPACE/zerodream"
setEnv 'ZD_HookPath' "$GITHUB_WORKSPACE/hook"
setEnv 'ZD_TempPath' "$GITHUB_WORKSPACE/.zerodream-temp" && mkdir -p "$ZD_TempPath"

# CIEnv
setEnv 'CI_AppPath' "$GITHUB_WORKSPACE/application"
setEnv 'CI_ConfigPath' "$GITHUB_WORKSPACE/config"
setEnv 'CI_ScriptPath' "$GITHUB_WORKSPACE/script"
setEnv 'CI_StoragePath' "$GITHUB_WORKSPACE/storage"

# --------------------------------------------------

# ZeroDreamCore
bash "$__ScriptDir/script/initEnv.sh"
bash "$__ScriptDir/script/mergeRepo.sh"
bash "$__ScriptDir/script/check.sh"
bash "$__ScriptDir/script/envVar.sh"

# --------------------------------------------------

# Must, otherwise the status code will be that of the previous command
exit 0
