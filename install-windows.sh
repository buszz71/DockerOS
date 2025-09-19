#!/bin/bash
set -e

echo "======================================="
echo "      Windows Installer by manz4vps     "
echo "======================================="

# Menu pilihan versi
echo "Pilih versi Windows:"
echo " Value  | Version                   | Size"
echo "------------------------------------------"
echo " 11     | Windows 11 Pro             | 5.4 GB"
echo " 11l    | Windows 11 LTSC            | 4.2 GB"
echo " 11e    | Windows 11 Enterprise      | 5.8 GB"
echo " 10     | Windows 10 Pro             | 5.7 GB"
echo " 10l    | Windows 10 LTSC            | 4.6 GB"
echo " 10e    | Windows 10 Enterprise      | 5.2 GB"
echo " 8e     | Windows 8.1 Enterprise     | 3.7 GB"
echo " 7e     | Windows 7 Enterprise       | 3.0 GB"
echo " ve     | Windows Vista Enterprise   | 3.0 GB"
echo " xp     | Windows XP Professional    | 0.6 GB"
echo " 2025   | Windows Server 2025        | 5.0 GB"
echo " 2022   | Windows Server 2022        | 4.7 GB"
echo " 2019   | Windows Server 2019        | 5.3 GB"
echo " 2016   | Windows Server 2016        | 6.5 GB"
echo " 2012   | Windows Server 2012        | 4.3 GB"
echo " 2008   | Windows Server 2008        | 3.0 GB"
echo " 2003   | Windows Server 2003        | 0.6 GB"
echo "======================================="

read -p "Masukkan value versi Windows: " VERSION
USERNAME="ManzXD"
PASSWORD="ManzXD"
RAM="4G"
CPU="2"
DISK="20G"
DISK2="20G"

# Buat file manz4windows.yml
cat > manz4windows.yml <<EOF
version: "3.8"
services:
  windows:
    image: manz4vps/windows
    container_name: windows
    environment:
      VERSION: "${VERSION}"
      USERNAME: "${USERNAME}"
      PASSWORD: "${PASSWORD}"
      RAM_SIZE: "${RAM}"
      CPU_CORES: "${CPU}"
      DISK_SIZE: "${DISK}"
      DISK2_SIZE: "${DISK2}"
    devices:
      - /dev/kvm
      - /dev/net/tun
    cap_add:
      - NET_ADMIN
    ports:
      - 8006:8006
      - 3389:3389/tcp
      - 3389:3389/udp
    stop_grace_period: 2m
EOF

echo "[INFO] File manz4windows.yml berhasil dibuat."
echo "[INFO] Menjalankan Windows versi: $VERSION"

# Jalankan docker-compose pakai file custom
sudo docker-compose -f manz4windows.yml up -d

echo "======================================="
echo " Windows $VERSION berhasil dijalankan!"
echo "---------------------------------------"
echo " WebUI : http://localhost:8006"
echo " RDP   : 🖥️RDP siap di jalankan..."
echo " User  : $USERNAME"
echo " Pass  : $PASSWORD"
echo "======================================="
