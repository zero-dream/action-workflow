#!/bin/bash
# Copyright (C) 2000 ZeroDream
# https://github.com/zero-dream

# --------------------------------------------------



# --------------------------------------------------

# GitClone
workflowRepo="zero-dream/action-workflow"
repoPath="$ZD_TempPath/__ZeroWorkflowRepo"
git clone --depth=1 https://github.com/$workflowRepo.git "$repoPath/" || exit 1 # Exit
# DeleteAndCopy
copyDirArr=(
  'data/config'
)
for copyDir in "${copyDirArr[@]}"; do
  mkdir -p "$ZD_RootPath/$copyDir/"
  find "$repoPath/zerodream/$copyDir/" -mindepth 1 -delete
  cp -a "$ZD_RootPath/$copyDir/." "$repoPath/zerodream/$copyDir/"
done
# MergeRepo
find "$ZD_RootPath/" -mindepth 1 -delete
cp -a "$repoPath/zerodream/." "$ZD_RootPath/"
rm -rf "$repoPath/"

# --------------------------------------------------

return 0
