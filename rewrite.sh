#!/bin/sh

#  rewrite.sh - 
#  
#  Copyright (c) 2011 [:VIM_EVAL:]authorname[:END_EVAL:] <[:VIM_EVAL:]authorsite[:END_EVAL:]>
#  2011-10-18 / ... | ...
# 
set -u
set -e

git filter-branch --commit-filter '
        if [ "$GIT_COMMITTER_NAME" = "buntar" ];
        then
                GIT_COMMITTER_NAME="Ben";
                GIT_AUTHOR_NAME="Ben";
                GIT_COMMITTER_EMAIL="ben@srctxt.org";
                GIT_AUTHOR_EMAIL="ben@srctxt.org";
                git commit-tree "$@";
        else
                git commit-tree "$@";
        fi' HEAD
