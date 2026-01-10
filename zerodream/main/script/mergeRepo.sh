#!/bin/bash
# Copyright (C) 2000 ZeroDream

# --------------------------------------------------

# MergeRepo
WorkflowRepo="zero-dream/action-workflow"
repoPath="$ZD_TempPath/WorkflowRepo"
git clone --depth=1 https://github.com/$WorkflowRepo.git "$repoPath/" || exit 1 # Exit
find "$ZD_MainPath/" -mindepth 1 -delete
cp -a "$repoPath/zerodream/." "$ZD_MainPath/"
rm -rf "$repoPath/"
