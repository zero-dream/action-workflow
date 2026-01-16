#!/bin/bash
# Copyright (C) 2000 ZeroDream
# https://github.com/zero-dream

# --------------------------------------------------

# MergeRepo
WorkflowRepo="zero-dream/action-workflow"
repoPath="$ZD_TempPath/WorkflowRepo"
git clone --depth=1 https://github.com/$WorkflowRepo.git "$repoPath/" || exit 1 # Exit
find "$ZD_RootPath/" -mindepth 1 -delete
cp -a "$repoPath/zerodream/." "$ZD_RootPath/"
rm -rf "$repoPath/"

# --------------------------------------------------

return 0
