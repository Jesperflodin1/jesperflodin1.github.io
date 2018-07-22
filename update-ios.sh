#!/bin/bash

#clean up
#find . -name ‘*.DS_Store’ -type f -delete
#uncomment these 2 lines if you don't want a downgrade option in Cydia 
#find ./debs -type f -name '*.deb' -delete
rm -r Packages.bz2

#debs
#format example
# dpkg-deb --bZlzma Projects/<projectname> <output folder>
#examples
dpkg-deb -bZgzip /var/mobile/Documents/jesperflodin1.github.io-master/jf.sb.1 debs

#packages
./dpkg-scanpackages -m ./debs /dev/null > Packages
bzip2 -fks Packages