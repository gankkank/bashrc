#!/bin/bash

load_ssh_keys() {
  for key in $@; do
    key_path=$(eval echo $key)
    [ ! -f $key_path ] && continue
    fingerprint=$(ssh-keygen -lf $key_path | cut -d " " -f 2)
    #echo $fingerprint
    ssh-add -l | grep " ${fingerprint} " &> /dev/null || ssh-add $key_path
  done
}

load_ssh_keys_from() {
  if [ -f $1 ] ; then
    load_ssh_keys $(cat $1 | grep -v "^#")
  fi
}
