#!/bin/bash

#clean up
find ~/Documents/GitHub/jesperflodin1.github.io/ -name ‘*.DS_Store’ -type f -delete
find ~/Documents/iOS-dev/ -name ‘*.DS_Store’ -type f -delete
find ~/Documents/Projects/Tweaks/ -name ‘*.DS_Store’ -type f -delete

#uncomment these 2 lines if you don't want a downgrade option in Cydia 
#find ./debs -type f -name '*.deb' -delete
#rm -r Packages.bz2

#debs
#format example
# dpkg-deb --bZlzma Projects/<projectname> <output folder>
#examples
dpkg-deb -bZgzip ~/Documents/iOS-dev/packages/SB.JF.1 ~/Documents/GitHub/jesperflodin1.github.io/debs
dpkg-deb -bZgzip ~/Documents/iOS-dev/packages/net.limneos.oslog ~/Documents/GitHub/jesperflodin1.github.io/debs
cp ~/Documents/Projects/Tweaks/tonehelper/packages/*.deb ~/Documents/GitHub/jesperflodin1.github.io/debs

#packages
dpkg-scanpackages -m ~/Documents/GitHub/jesperflodin1.github.io/debs > ~/Documents/GitHub/jesperflodin1.github.io/Packages
bzip2 -fks ~/Documents/GitHub/jesperflodin1.github.io/Packages
