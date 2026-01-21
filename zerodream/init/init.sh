#!/bin/bash
# Copyright (C) 2000 ZeroDream
# https://github.com/zero-dream

# --------------------------------------------------

# ScriptDir
__ScriptDir=$(dirname "${BASH_SOURCE[0]}")

# --------------------------------------------------

# ZeroDreamCore
bash "$__ScriptDir/script/envVar.sh"
bash "$__ScriptDir/script/initEnv.sh"
bash "$__ScriptDir/script/mergeRepo.sh"
bash "$__ScriptDir/script/check.sh"

# --------------------------------------------------

# Must, otherwise the status code will be that of the previous command
exit 0
