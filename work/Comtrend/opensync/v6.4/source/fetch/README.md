---
markmap:
  color:
    - blue
  initialExpandLevel: 4
  # other options
---

# [go back](../index.html)
# fetch v6.4.3.0
```bash
#!/bin/bash
src=src
ver=V_6.4.3.0
rm -rf $src
git clone https://github.com/plume-design/opensync.git $src/core
git clone https://github.com/plume-design/opensync-platform-bcm.git $src/platform/bcm
git clone https://github.com/plume-design/opensync-vendor-bcm-template.git $src/vendor/bcm-template
git clone https://github.com/plume-design/opensync-service-provider-local.git $src/service-provider/local
mkdir -p $src/3rdparty
cd $src/core
git checkout tags/$ver -b $ver
cd -
cd $src/platform/bcm
git checkout tags/$ver -b $ver
cd -
cd $src/vendor/bcm-template
git checkout tags/$ver -b $ver
cd -
# cd $src/service-provider/local
# git checkout tags/$ver -b $ver
# cd -
```
