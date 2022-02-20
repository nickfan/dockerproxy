#!/usr/bin/env bash

function setpx(){
  local pxuri="${1:-http://127.0.0.1:7890}"
  export https_proxy="${pxuri}";
  export http_proxy="${pxuri}";
  export all_proxy="${pxuri}";
}

function setnopx(){
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset all_proxy
}
function gitsetpx(){
  local pxuri="${1:-http://127.0.0.1:7890}"
  git config --global http.proxy '${pxuri}'
  git config --global https.proxy '${pxuri}'
}
function gitsetnopx(){
    git config --global --unset http.proxy
    git config --global --unset https.proxy
}
