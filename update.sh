#!/bin/bash


#change cwd
cd ~/Documents/GitHub/jesperflodin1.github.io/
#clean up
find . -name ‘*.DS_Store’ -type f -delete
find ~/Documents/iOS-dev/ -name ‘*.DS_Store’ -type f -delete
find ~/Documents/Projects/Tweaks/ -name ‘*.DS_Store’ -type f -delete

#uncomment these 2 lines if you don't want a downgrade option in Cydia 
#find ./debs -type f -name '*.deb' -delete
#rm -r Packages.bz2

#debs
#format example
# dpkg-deb --bZlzma Projects/<projectname> <output folder>
#examples
dpkg-deb -bZgzip ~/Documents/iOS-dev/packages/SB.JF.1 debs
dpkg-deb -bZgzip ~/Documents/iOS-dev/packages/net.limneos.oslog debs
cp ~/Documents/Projects/Tweaks/tonehelper/packages/*.deb debs

#packages
dpkg-scanpackages -m ./debs > Packages
bzip2 -fks Packages

#change cwd to previous
cd -