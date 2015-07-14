#!/bin/bash
script_path=${BASH_SOURCE[0]}
script_dir=$(dirname $script_path)
cd ${script_dir}/

if [ "$(uname)" == "Darwin" ]; then
  . ps1.mac.sh
  . bash_completion
else
  . ps1.sh
fi

#[ "$(uname)" == "Darwin" ] && . ps1.mac.sh || . ps1.sh

. alias.sh
. ssh-agent.sh

load_ssh_keys_from ~/.ssh-agent.keys
