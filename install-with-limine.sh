#!/bin/sh

mkfs.vfat -F32 -n BOOT /dev/nvme0n1p1;
mkfs.btrfs -f -L "Arch Linux" /dev/nvme0n1p2;

mount /dev/nvme0n1p2 /mnt;
btrfs subvolume create /mnt/@;
btrfs subvolume create /mnt/@home;
btrfs subvolume create /mnt/@srv;
btrfs subvolume create /mnt/@log;
btrfs subvolume create /mnt/@tmp;
btrfs subvolume create /mnt/@opt;
btrfs subvolume create /mnt/@cache;
umount /mnt;
mount -o noatime,commit=120,ssd,discard,space_cache=v2,compress=zstd,subvol=@ /dev/nvme0n1p2 /mnt;
mkdir /mnt/{boot,home,etc,srv,opt,var};
mkdir /mnt/var/{log,tmp,cache};
mount -o noatime,commit=120,ssd,discard,space_cache=v2,compress=zstd,subvol=@home /dev/nvme0n1p2 /mnt/home;
mount -o noatime,commit=120,ssd,discard,space_cache=v2,compress=zstd,subvol=@opt /dev/nvme0n1p2 /mnt/opt;
mount -o noatime,commit=120,ssd,discard,space_cache=v2,compress=zstd,subvol=@srv /dev/nvme0n1p2 /mnt/srv;
mount -o noatime,commit=120,ssd,discard,space_cache=v2,compress=zstd,subvol=@cache /dev/nvme0n1p3 /mnt/var/cache;
mount -o noatime,commit=120,ssd,discard,space_cache=v2,compress=zstd,subvol=@log /dev/nvme0n1p3 /mnt/var/log;
mount -o noatime,commit=120,ssd,discard,space_cache=v2,compress=zstd,subvol=@tmp /dev/nvme0n1p3 /mnt/var/tmp;
mount /dev/nvme0n1p1 /mnt/boot;
echo ' ' > /mnt/etc/vconsole.conf
pacstrap -K /mnt base base-devel linux-zen linux-zen-headers linux-firmware amd-ucode dkms wireplumber pipewire-pulse pipewire-alsa pipewire-jack sof-firmware alsa-firmware networkmanager net-tools ntfs-3g exfat-utils btrfs-progs limine efibootmgr os-prober nano wget curl git;
genfstab -U /mnt >> /mnt/etc/fstab;
arch-chroot /mnt;
