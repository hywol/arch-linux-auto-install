#!/bin/sh

mkfs.vfat -F32 -n ESP /dev/nvme0n1p1;
mkfs.ext4 -L Boot /dev/nvme0n1p2;
mkfs.btrfs -f -L Arch /dev/nvme0n1p3;

mount /dev/nvme0n1p3 /mnt;
btrfs subvolume create /mnt/@;
btrfs subvolume create /mnt/@home;
btrfs subvolume create /mnt/@opt;
btrfs subvolume create /mnt/@cache;
umount /mnt;
mount -o noatime,commit=120,ssd,space_cache=v2,compress=zstd,subvol=@ /dev/nvme0n1p3 /mnt;
mkdir /mnt/{efi,boot,home,opt,var};
mkdir /mnt/var/cache;
mount -o noatime,commit=120,ssd,space_cache=v2,compress=zstd,subvol=@home /dev/nvme0n1p3 /mnt/home;
mount -o noatime,commit=120,ssd,space_cache=v2,compress=zstd,subvol=@opt /dev/nvme0n1p3 /mnt/opt;
mount -o noatime,commit=120,ssd,subvol=@cache /dev/nvme0n1p3 /mnt/var/cache;
mount /dev/nvme0n1p2 /mnt/boot;
mount /dev/nvme0n1p1 /mnt/efi;
pacstrap -K /mnt base base-devel linux-zen linux-zen-headers linux-firmware amd-ucode dkms wireplumber pipewire-pulse pipewire-alsa pipewire-jack sof-firmware alsa-firmware networkmanager net-tools grub efibootmgr os-prober nano wget curl git;
genfstab -U /mnt >> /mnt/etc/fstab;
arch-chroot /mnt;

