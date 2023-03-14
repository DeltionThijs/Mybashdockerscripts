for i in *.vmdk; do qemu-img convert -f vmdk $i -O vmdk $i.vmdk; done
cat *.vmdk > tmpImage.vmdk
qemu-img convert tmpImage.raw finalImage.qcow2
rm *.vmdk