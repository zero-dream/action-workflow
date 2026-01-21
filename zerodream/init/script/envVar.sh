#!/bin/bash
# Copyright (C) 2000 ZeroDream
# https://github.com/zero-dream

# --------------------------------------------------

# ScriptDir
__ScriptDir=$(dirname "${BASH_SOURCE[0]}")

# Source
source "$__ScriptDir/../../library/setEnv.sh"
source "$__ScriptDir/../../library/createPath.sh"

# --------------------------------------------------

# ZDEnv
setEnv 'ZD_Owner' 'zero-dream'
setEnv 'ZD_DATE' "$(TZ=UTC date '+%y%m%d%H%M%S')"
setEnv 'ZD_RootPath' "$GITHUB_WORKSPACE/zerodream"
setEnv 'ZD_HookPath' "$GITHUB_WORKSPACE/hook"
setEnv 'ZD_TempPath' "$GITHUB_WORKSPACE/.zerodream-temp" && mkdir -p "$ZD_TempPath"

# ZDRootEnv
setEnv 'ZD_LibPath' "$ZD_RootPath/library"
setEnv 'ZD_ConfigPath' "$ZD_RootPath/config"
setEnv 'ZD_DataPath' "$ZD_RootPath/data"

# CIEnv
setEnv 'CI_AppPath' "$GITHUB_WORKSPACE/application"
setEnv 'CI_ConfigPath' "$GITHUB_WORKSPACE/config"
setEnv 'CI_ScriptPath' "$GITHUB_WORKSPACE/script"
setEnv 'CI_StoragePath' "$GITHUB_WORKSPACE/storage"

# --------------------------------------------------

# UploadReleasePath
releaseUploadPath=$(createTempPath '__ZeroReleaseUpload:dir')
setEnv 'ZD_ReleaseUploadPath' "$releaseUploadPath"

# UploadArtifactPath
artifactUploadPath=$(createTempPath '__ZeroArtifactUpload:dir')
setEnv 'ZD_ArtifactUploadPath' "$artifactUploadPath"

# --------------------------------------------------

exit 0
