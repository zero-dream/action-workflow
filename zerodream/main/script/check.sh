#!/bin/bash
# Copyright (C) 2000 ZeroDream
# https://github.com/zero-dream

# --------------------------------------------------

# CheckScript
[[ -d "$GITHUB_WORKSPACE/" ]] && find "$GITHUB_WORKSPACE/" -type f \
  -iregex ".*\.\(sh\|hook\)$" \
  -exec chmod +x {} \;
[[ -d "$ZD_RootPath/" ]] && find "$ZD_RootPath/" -type f \
  ! -name '.gitkeep' \
  -exec chmod +x {} \;
[[ -d "$CI_AppPath/" ]] && find "$CI_AppPath/" -type f \
  ! -name '.gitkeep' \
  -exec chmod +x {} \;

# --------------------------------------------------

return 0
