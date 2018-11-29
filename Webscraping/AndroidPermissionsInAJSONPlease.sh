#!/bin/bash
# A Script that takes the AndroidManifest file and boils the contents over a
# medium vim to get a JSON db of comments and carious other data from the XML 
curl https://raw.githubusercontent.com/aosp-mirror/platform_frameworks_base/master/core/res/AndroidManifest.xml > AndroidManifest.xml

permissionCount=$(grep "<permission " AndroidManifest.xml | wc -l)
MACRO=$(mktemp)

cat <<EOF >$MACRO
qy/manifest>
:%s/<p>//g
:%s/@[a-zA-Z]*//g
:%s/^[ ]*//g
:g/android:description/d
:g/android:label/d
:g/android.label/d
:g/android:permissionGroup/d
:%s/android://g
:%s/<permission /},{\r/g
:%s/\/>//g
Gqp?<!--
:%s/{[^#]*#\([a-zA-Z_0-9]*\)}/\1/g
:%s/[^,]{//g
:%s/}[^,]//g
:%s/<a[^"]*//g
:%s/\/a>//g
:%s/<[^>!]*>//g
:%s/"/'/g
:%s/='/:"/g
:%s/'[ ]*$/"/g
:%s/^name/"name"/g
:%s/^protectionLevel/"protectionLevel"/g
:%s/^permissionFlags/"permissionFlags"/g
:%s/<!--[ ]*/"description":"/g
:%s/[ ]*-->/"/g
:%s/[ ]*$//g
:%s/"$/",/g
:%s/[^\^]}/}\r/g
:%s/}$/\r},{/g
:g/^,{$/d
Gqq?"description":
ggddO[{Go}]:wq! temp.json
EOF

vim AndroidManifest.xml -s $MACRO
cat temp.json \
    | tr -d '\r\n' \
    | sed -e 's/,}/}/g' -e 's/""/","/g' \
    | sed -e 's/""/","/g' \
    | sed -e 's/\({"description":"[^"]*"\)},{/\1,/g' \
    | jq . \
        > Permissions.json 

rm temp.json
