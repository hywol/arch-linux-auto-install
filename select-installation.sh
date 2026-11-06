#!/bin/bash

PS3="Select your Installation: "

select menu in "Intel CPU with Default Kernel" "Intel CPU with Zen Kernel" "AMD CPU with Default Kernel" "AMD CPU with Zen Kernel"
do
    case $menu in
        "Intel CPU with Default Kernel")
            pacstrap -K /mnt base base-devel linux linux-headers linux-firmware intel-ucode dkms wireplumber pipewire-pulse pipewire-alsa pipewire-jack sof-firmware alsa-firmware networkmanager net-tools exfat-utils btrfs-progs limine efibootmgr os-prober nano wget curl git;
            genfstab -U /mnt >> /mnt/etc/fstab;
            break
            ;;
        "Intel CPU with Zen Kernel")
            pacstrap -K /mnt base base-devel linux-zen linux-zen-headers linux-firmware intel-ucode dkms wireplumber pipewire-pulse pipewire-alsa pipewire-jack sof-firmware alsa-firmware networkmanager net-tools exfat-utils btrfs-progs limine efibootmgr os-prober nano wget curl git;
            genfstab -U /mnt >> /mnt/etc/fstab;
            break
            ;;
        "AMD CPU with Default Kernel")
            pacstrap -K /mnt base base-devel linux linux-headers linux-firmware intel-ucode dkms wireplumber pipewire-pulse pipewire-alsa pipewire-jack sof-firmware alsa-firmware networkmanager net-tools exfat-utils btrfs-progs limine efibootmgr os-prober nano wget curl git;
            genfstab -U /mnt >> /mnt/etc/fstab;
            break
            ;;
        "AMD CPU with Zen Kernel")
            pacstrap -K /mnt base base-devel linux-zen linux-zen-headers linux-firmware intel-ucode dkms wireplumber pipewire-pulse pipewire-alsa pipewire-jack sof-firmware alsa-firmware networkmanager net-tools exfat-utils btrfs-progs limine efibootmgr os-prober nano wget curl git;
            genfstab -U /mnt >> /mnt/etc/fstab;
            break
            ;;
        *)
            echo "Input vaild numbers."
            ;;
    esac
done
