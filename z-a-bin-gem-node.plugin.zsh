#!/usr/bin/env zsh
#
# Original work Copyright (c) 2019-2020 Sebastian Gniazdowski
# Modified work Copyright (c) 2022 zdharma-continuum and contributors

# According to the Zsh Plugin Standard:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

autoload +Xz -U \
  :za-bgn::bin-or-src-function-body \
  :za-bgn::bin-or-src-function-body-cygwin \
  :za-bgn::mod-function-body \
  za-bgn::atclone-handler \
  za-bgn::atdelete-handler \
  za-bgn::atload-handler \
  za-bgn::help-handler \
  za-bgn::shim-list

autoload -Uz \
  za-bgn::atpull-handler

# An empty stub to fill the help handler fields
za-bgn::null-handler() { :; }

@zinit-register-annex "zinit-annex-bin-gem-node" \
  subcommand:shim-list \
  za-bgn::shim-list \
  za-bgn::null-handler

@zinit-register-annex "zinit-annex-bin-gem-node" \
  hook:\!atload-50 \
  za-bgn::atload-handler \
  za-bgn::help-handler \
  "fbin''|ferc''|fmod''|fsrc''|gem''|node''|pip''|sbin|sbin''"

@zinit-register-annex "zinit-annex-bin-gem-node" \
  hook:atclone-50 \
  za-bgn::atclone-handler \
  za-bgn::null-handler

@zinit-register-annex "zinit-annex-bin-gem-node" \
  hook:\%atpull-50 \
  za-bgn::atclone-handler \
  za-bgn::null-handler

@zinit-register-annex "zinit-annex-bin-gem-node" \
  hook:atdelete-50 \
  za-bgn::atdelete-handler \
  za-bgn::null-handler

# vim: set expandtab filetype=zsh shiftwidth=2 softtabstop=2 tabstop=2:
