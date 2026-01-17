#!/bin/bash
# Copyright (C) 2000 ZeroDream
# https://github.com/zero-dream

# --------------------------------------------------

# LibraryPath
setEnv 'ZD_LibPath' "$ZD_RootPath/library"
setEnv 'ZD_AppLibPath' "$ZD_LibPath/application"
setEnv 'ZD_ScriptLibPath' "$ZD_LibPath/script"

# ConfigPath
setEnv 'ZD_ConfigPath' "$ZD_RootPath/config"

# DataPath
setEnv 'ZD_DataPath' "$ZD_RootPath/data"
setEnv 'ZD_ConfigDataPath' "$ZD_DataPath/config"

# --------------------------------------------------

# Source
source "$ZD_ScriptLibPath/createPath.sh"

# --------------------------------------------------

# UploadReleasePath
releaseUploadPath=$(createTempPath '__ZeroReleaseUpload:dir')
setEnv 'ZD_ReleaseUploadPath' "$releaseUploadPath"

# UploadArtifactPath
artifactUploadPath=$(createTempPath '__ZeroArtifactUpload:dir')
setEnv 'ZD_ArtifactUploadPath' "$artifactUploadPath"

# --------------------------------------------------

return 0
