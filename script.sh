#! /bin/bash

src="/source/folder/images/"
dst="/destination/folder/"
sudo ls $src | egrep "*.vdmk" | xargs -I _ sudo qemu-img convert -p -f vmdk -O qcow2 $src"" $dst".qcow2"