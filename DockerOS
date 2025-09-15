#!/bin/bash

echo "Pilih OS yang mau dijalankan:"
echo "1) Ubuntu 24"
echo "2) Ubuntu 22"
echo "3) Debian 11"
echo "4) Debian 12"
read -p "Masukkan pilihan (1-4): " pilihan

case $pilihan in
    1)
        IMAGE="manz4you/ubuntu24"
        ;;
    2)
        IMAGE="manz4you/ubuntu22"
        ;;
    3)
        IMAGE="manz4you/debian11"
        ;;
    4)
        IMAGE="manz4you/debian12"
        ;;
    *)
        echo "Pilihan tidak valid!"
        exit 1
        ;;
esac

echo "Berapa limit RAM yang mau dipakai? (contoh: 1g, 512m)"
read RAM_LIMIT

echo "Berapa limit CPU yang mau dipakai? (contoh: 0.5 untuk setengah core, 1 untuk 1 core, 2 untuk 2 core)"
read CPU_LIMIT

CONTAINER_NAME="mycontainer"

echo "Menjalankan Docker image: $IMAGE dengan limit RAM=$RAM_LIMIT dan CPU=$CPU_LIMIT"

docker run -it --name $CONTAINER_NAME --memory $RAM_LIMIT --cpus $CPU_LIMIT $IMAGE
