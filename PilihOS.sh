#!/bin/bash

# Warna
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
WHITE="\e[37m"
RESET="\e[0m"
BOLD="\e[1m"

# Banner
banner() {
    clear
    echo -e "${CYAN}${BOLD}"
    echo "====================================="
    echo "      DOCKER OS LAUNCHER MENU        "
    echo "         Created by Manz4Ndaa        "
    echo "====================================="
    echo -e "${RESET}"
}

# Menu Docker OS
show_menu() {
    banner
    echo -e "${BOLD}====== MENU DOCKER OS ======${RESET}"
    echo -e "${BOLD}1.${RESET} Ubuntu 24"
    echo -e "${BOLD}2.${RESET} Ubuntu 22"
    echo -e "${BOLD}3.${RESET} Debian 11"
    echo -e "${BOLD}4.${RESET} Debian 12"
    echo -e "${BOLD}5.${RESET} Attach ke container lama"
    echo -e "${BOLD}6.${RESET} Hapus container"
    echo -e "${BOLD}7.${RESET} Keluar"
    echo -ne "${CYAN}Pilih opsi [1-7]: ${RESET}"
}

# Jalankan container baru
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

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Container $NAME berhasil dijalankan!${RESET}"
        echo "Masuk ke container sekarang..."
        sleep 2
        docker exec -it "$NAME" bash || docker exec -it "$NAME" sh
    else
        echo -e "${RED}Gagal menjalankan container!${RESET}"
    fi
}

# Attach ke container lama
attach_container() {
    echo -e "${YELLOW}Daftar container aktif:${RESET}"
    docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"

    echo
    read -p "Masukkan nama container yang mau di-attach: " NAME
    if [ -z "$NAME" ]; then
        echo -e "${RED}Nama container tidak boleh kosong!${RESET}"
        sleep 2
        return
    fi

    if docker ps -a --format '{{.Names}}' | grep -qw "$NAME"; then
        echo -e "${GREEN}Masuk ke container $NAME...${RESET}"
        sleep 1
        docker exec -it "$NAME" bash || docker exec -it "$NAME" sh
    else
        echo -e "${RED}Container $NAME tidak ditemukan!${RESET}"
        sleep 2
    fi
}

# Hapus container
delete_container() {
    echo -e "${YELLOW}Daftar semua container:${RESET}"
    docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"

    echo
    read -p "Masukkan nama container yang mau dihapus: " NAME
    if [ -z "$NAME" ]; then
        echo -e "${RED}Nama container tidak boleh kosong!${RESET}"
        sleep 2
        return
    fi

    if docker ps -a --format '{{.Names}}' | grep -qw "$NAME"; then
        echo -e "${RED}Menghentikan & menghapus container $NAME...${RESET}"
        docker stop "$NAME" && docker rm "$NAME"
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}Container $NAME berhasil dihapus.${RESET}"
        else
            echo -e "${RED}Gagal menghapus container $NAME.${RESET}"
        fi
    else
        echo -e "${RED}Container $NAME tidak ditemukan!${RESET}"
        sleep 2
    fi
}

# Main loop
while true; do
    show_menu
    read -r choice
    case $choice in
        1) run_container "manz4you/ubuntu24" ;;
        2) run_container "manz4you/ubuntu22" ;;
        3) run_container "manz4you/debian11" ;;
        4) run_container "manz4you/debian12" ;;
        5) attach_container ;;
        6) delete_container ;;
        7) echo "Keluar..."; exit 0 ;;
        *) echo -e "${RED}Pilihan tidak valid!${RESET}"; sleep 1 ;;
    esac
done
