#!/bin/bash
apt-get install -y anbox-modules-dkms android-tools-adb
modprobe ashmem_linux
modprobe binder_linux
wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/4.1.1.0/android-studio-ide-201.6953283-linux.tar.gz
tar -xf android-studio-ide-201.6953283-linux.tar.gz
cd android-studio/bin
./studio.sh
adb start-server
wget -O app.apk `curl -s 'http://ws75.aptoide.com/api/7/apps/search/query=com.innersloth.spacemafia/limit=1' | jq -r ".datalist.list[0].file.path"`
adb install app.apk
anbox
