#!/bin/sh

set -xefu

backing_image_path='/home/fedorovand/myrepos/alt-packer/images/alt-server-10.4-cloud-20250402-5f2882d-x86_64.qcow2'
disk_file_path='./images/disk.iso'
img_file_path='./images/disk.qcow2'
cloud_init_path='/home/fedorovand/cloud-init/my-seed.img'
ovmf_code='/usr/share/OVMF/OVMF_CODE.fd'
ovmf_vars='/home/fedorovand/local/share/OVMF_VARS.fd'


function test_bios {
	qemu-img create -f qcow2 "$disk_file_path" 12G
	qemu-img create -F qcow2 -b "$backing_image_path" -f qcow2 "$img_file_path"

	## BIOS
	qemu-system-x86_64 \
		-accel kvm -cpu host -m 2048 \
		-smp 4 -nographic \
		-blockdev driver=qcow2,node-name=disk1,file.driver=file,file.filename=$img_file_path \
		-device virtio-blk-pci,drive=disk1 \
		-drive file=$disk_file_path,media=cdrom -device usb-ehci -device usb-kbd -device usb-mouse \
		-drive file=$cloud_init_path,if=virtio,format=raw,force-share=on,read-only=on \
		-netdev user,id=net0,hostfwd=tcp:127.0.0.1:24000-:22 \
		-device virtio-net-pci,netdev=net0 -display gtk

	rm -rf "$disk_file_path"
	rm -rf "$img_file_path"
}

function test_efi {
	qemu-img create -f qcow2 "$disk_file_path" 12G            
	qemu-img create -F qcow2 -b "$backing_image_path" -f qcow2 "$img_file_path"

	## UEFI
	qemu-system-x86_64 \
		-accel kvm -cpu host -m 2048 \
		-smp 4 -nographic \
		-blockdev driver=qcow2,node-name=disk1,file.driver=file,file.filename=$img_file_path \
		-device virtio-blk-pci,drive=disk1 \
		-drive file=$disk_file_path,media=cdrom -device usb-ehci -device usb-kbd -device usb-mouse \
		-drive file=$cloud_init_path,if=virtio,format=raw,force-share=on,read-only=on \
		-drive if=pflash,format=raw,readonly=on,unit=0,file=$ovmf_code \
		-drive if=pflash,format=raw,unit=1,file=$ovmf_vars \
		-smbios type=0,uefi=on \
		-netdev user,id=net0,hostfwd=tcp:127.0.0.1:24000-:22 \
		-device virtio-net-pci,netdev=net0 -display gtk

	rm -rf "$disk_file_path"
        rm -rf "$img_file_path"
}

test_bios
