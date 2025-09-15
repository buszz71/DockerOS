#!/bin/bash

# Warna
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RESET="\e[0m"
BOLD="\e[1m"

# Menu Docker OS
show_menu() {
    clear
    echo -e "${BOLD}====== MENU DOCKER OS ======${RESET}"
    echo -e "${BOLD}1.${RESET} Ubuntu 24"
    echo -e "${BOLD}2.${RESET} Ubuntu 22"
    echo -e "${BOLD}3.${RESET} Debian 11"
    echo -e "${BOLD}4.${RESET} Debian 12"
    echo -e "${BOLD}5.${RESET} Keluar"
    echo -ne "${CYAN}Pilih opsi [1-5]: ${RESET}"
}

# Jalankan container
run_container() {
    IMAGE=$1
    read -p "Limit RAM (misal 1g / 512m): " RAM_LIMIT
    read -p "Limit CPU (misal 1 / 0.5 / 2): " CPU_LIMIT
    read -p "Nama container (default: autobot): " NAME
    NAME=${NAME:-autobot}

    echo -e "${YELLOW}Menjalankan container: $IMAGE${RESET}"
    docker run -dit \
      --name "$NAME" \
      --memory "$RAM_LIMIT" \
      --cpus "$CPU_LIMIT" \
      --restart unless-stopped \
      "$IMAGE"
    echo -e "${GREEN}Container $NAME berhasil dijalankan!${RESET}"
    read -p "Tekan Enter untuk kembali ke menu..."
}

# Loop menu
while true; do
    show_menu
    read -r choice
    case $choice in
        1) run_container "manz4you/ubuntu24" ;;
        2) run_container "manz4you/ubuntu22" ;;
        3) run_container "manz4you/debian11" ;;
        4) run_container "manz4you/debian12" ;;
        5) echo "Keluar..."; exit 0 ;;
        *) echo -e "${RED}Pilihan tidak valid!${RESET}"; sleep 1 ;;
    esac
done
