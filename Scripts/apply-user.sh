#!/bin/sh
pushd ~/.dotfiles
home-manager switch -f ./users/paulo/home.nix
popd