#! /bin/bash
src="/home/thijs/vmdk/"
dest="/home/thijs/qcow2/"
sudo ls $src | exec grep -E "*.vmdk"  | xargs -I _ sudo qemu-img convert -p -f 'home/thijs/vmdk/*.vmdk' -O qcow2 
sudo ls $src | exec grep -E "*.qcow2" | xargs -I _ mv $src"_" $dest