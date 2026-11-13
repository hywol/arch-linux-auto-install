# arch-linux-auto-install
Arch Linux Kernel Auto Install Script/아치 리눅스 커널 자동 설치 스크립트

## 기능 / Features

 * Limine 부트로더 / Limine Bootloader
 * CPU 및 커널별 설치옵션 제공 / Provide installation option to select CPU and Kernels

## 사용법/How to Use

Repartitioning 1536M Boot Partition and Primary Partition, launch it.

 * If you use SATA SSD/SATA SSD 사용 시 주의

  Change /dev/nvme0n1p1 and /dev/nvme0n1p2 into /dev/sda1 and /dev/sda2.
 
 * Install another storage/다른 저장장치에 설치

  Change /dev/nvme0n1p1 and /dev/nvme0n1p2 into your storage device place.
  
 * Install on Intel System/인텔 CPU PC에 설치
 
  Change amd-ucode into intel-ucode.

## 설치 후/After Installation
