#!/bin/bash
script_path=${BASH_SOURCE[0]}
script_dir=$(dirname $script_path)
#cd ${script_dir}/

enable_completion=0

function enable_mac_completion() {
  [ -d /usr/local/etc/ ] || mkdir /usr/local/etc/
  [ -f /usr/local/etc/bash_completion ] || cp bash_completion /usr/local/etc/bash_completion
  . /usr/local/etc/bash_completion
}

if [ "$(uname)" == "Darwin" ]; then
  . ${script_dir}/ps1.mac.sh
  [ "$enable_completion" == "0" ] || enable_mac_completion
else
  . ${script_dir}/ps1.sh
fi


. ${script_dir}/alias.sh
. ${script_dir}/ssh-agent.sh

load_ssh_keys_from ~/.ssh-agent.keys
