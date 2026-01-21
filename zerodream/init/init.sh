#!/bin/bash
# Copyright (C) 2000 ZeroDream
# https://github.com/zero-dream

# --------------------------------------------------

# ScriptDir
__ScriptDir=$(dirname "${BASH_SOURCE[0]}")

# Source
source "$__ScriptDir/../library/setEnv.sh"

# --------------------------------------------------

# ZDEnv
setEnv 'ZD_Owner' 'zero-dream'
setEnv 'ZD_DATE' "$(TZ=UTC date '+%y%m%d%H%M%S')"
setEnv 'ZD_RootPath' "$GITHUB_WORKSPACE/zerodream"
setEnv 'ZD_HookPath' "$GITHUB_WORKSPACE/hook"
setEnv 'ZD_TempPath' "$GITHUB_WORKSPACE/.zerodream-temp" && mkdir -p "$ZD_TempPath"

# --------------------------------------------------

# ZeroDreamCore
bash "$__ScriptDir/script/initEnv.sh"
bash "$__ScriptDir/script/mergeRepo.sh"
source "$__ScriptDir/script/envVar.sh"
bash "$__ScriptDir/script/check.sh"

# --------------------------------------------------

# Must, otherwise the status code will be that of the previous command
exit 0
