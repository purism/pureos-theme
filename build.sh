#!/bin/sh
set -e
clear
basedir=$(echo $PWD)

# get source and cd into it.
rm -rf pureos-theme*
cp "$basedir"/data ./pureos-theme -r && cd pureos-theme*

sed -e "s_^Maintainer.*_Maintainer: PureOS GNU/Linux developers <dev@puri.sm>_g" -i debian/control

# go back to the base directory and build.
apt-src import pureos-theme --here
echo "Building pureos-theme..."
pdebuild
cd $basedir
