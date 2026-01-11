#!/bin/bash
# Copyright (C) 2000 ZeroDream

# --------------------------------------------------

# LibraryPath
setEnv 'ZD_LibPath' "$ZD_MainPath/library"
setEnv 'ZD_AppLibPath' "$ZD_LibPath/application"
setEnv 'ZD_ScriptLibPath' "$ZD_LibPath/script"

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
