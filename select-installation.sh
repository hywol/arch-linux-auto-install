#!/bin/bash

PS3="Select your Installation: "

select menu in "Intel CPU with Default Kernel" "Intel CPU with Zen Kernel" "AMD CPU with Default Kernel" "AMD CPU with Zen Kernel"
do
    case $menu in
        "Intel CPU with Default Kernel")
            pacman -S steam lutris innoextract vkd3d lib32-vkd3d vulkan-intel lib32-vulkan-intel lib32-gamemode gamemode gamescope mangohud --noconfirm;
            break
            ;;
        "Intel CPU with Zen Kernel")
            pacman -S steam lutris innoextract vkd3d lib32-vkd3d vulkan-radeon lib32-vulkan-radeon lib32-gamemode gamemode gamescope mangohud --noconfirm;
            break
            ;;
        "AMD CPU with Default Kernel")
            pacman -S steam lutris innoextract vkd3d lib32-vkd3d vulkan-intel lib32-vulkan-intel lib32-gamemode gamemode gamescope mangohud --noconfirm;
            break
            ;;
        "AMD CPU with Zen Kernel")
            pacman -S steam lutris innoextract vkd3d lib32-vkd3d vulkan-radeon lib32-vulkan-radeon lib32-gamemode gamemode gamescope mangohud --noconfirm;
            break
            ;;
    esac
done
