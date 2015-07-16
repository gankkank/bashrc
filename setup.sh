#!/bin/bash

if ! [ -d ~/.bash ]; then
  git clone https://github.com/gankkank/bashrc ~/.bash
fi

if grep '. ~/.bash/init.sh' ~/.bash_profile > /dev/null; then
  echo '[notice] init script already enabled.'
else
  echo '. ~/.bash/init.sh' >> ~/.bash_profile
fi
