#!/bin/bash  

# Warna
MERAH="\e[31m"
HIJAU="\e[32m"
KUNING="\e[33m"
BIRU="\e[36m"
PUTIH="\e[37m"
RESET="\e[0m"
TEBAL="\e[1m"

# Banner
banner() {
    clear
    echo -e "${BIRU}${TEBAL}"
    echo "====================================="
    echo "        LAUNCHER SCRIPT OTOMATIS     "
    echo "          Dibuat oleh Manz4Ndaa      "
    echo "====================================="
    echo -e "${RESET}"
}

# Cek apakah curl sudah terpasang
cek_curl() {
    if ! command -v curl &>/dev/null; then
        echo -e "${MERAH}${TEBAL}Error: curl belum terpasang.${RESET}"
        echo -e "${KUNING}Menginstall curl...${RESET}"
        if command -v apt-get &>/dev/null; then
            sudo apt-get update && sudo apt-get install -y curl
        elif command -v yum &>/dev/null; then
            sudo yum install -y curl
        elif command -v dnf &>/dev/null; then
            sudo dnf install -y curl
        else
            echo -e "${MERAH}Gagal menginstall curl otomatis. Silakan pasang manual.${RESET}"
            exit 1
        fi
        echo -e "${HIJAU}curl berhasil dipasang!${RESET}"
    fi
}

# Jalankan script dari internet
jalankan_script() {
    local url=$1
    local nama_script=$(basename "$url" .sh)
    nama_script=$(echo "$nama_script" | sed 's/.*/\u&/')

    echo -e "${KUNING}${TEBAL}Menjalankan: ${BIRU}${nama_script}${RESET}"
    cek_curl

    local temp_script=$(mktemp)
    echo -e "${KUNING}Mengunduh script...${RESET}"

    if curl -fsSL "$url" -o "$temp_script"; then
        echo -e "${HIJAU}✓ Unduhan berhasil${RESET}"
        chmod +x "$temp_script"
        bash "$temp_script"
        local kode=$?
        rm -f "$temp_script"
        if [ $kode -eq 0 ]; then
            echo -e "${HIJAU}✓ Script berhasil dijalankan${RESET}"
        else
            echo -e "${MERAH}✗ Script gagal dijalankan dengan kode keluar: $kode${RESET}"
        fi
    else
        echo -e "${MERAH}✗ Gagal mengunduh script${RESET}"
    fi
    echo
    read -p "Tekan Enter untuk lanjut..."
}

# Info sistem
info_sistem() {
    echo -e "${TEBAL}INFORMASI SISTEM${RESET}"
    echo "Hostname : $(hostname)"
    echo "User     : $(whoami)"
    echo "Direktori: $(pwd)"
    echo "Sistem   : $(uname -srm)"
    echo "Uptime   : $(uptime -p)"
    echo "Memori   : $(free -h | awk '/Mem:/ {print $3\"/\"$2}')"
    echo "Disk     : $(df -h / | awk 'NR==2 {print $3\"/\"$2 \" (\"$5\")\"}')"
    echo
    read -p "Tekan Enter untuk lanjut..."
}

# Menu
tampilkan_menu() {
    banner
    menu_content=$(cat <<EOF
${TEBAL}========== MENU UTAMA ===========${RESET}
${TEBAL}1. Panel${RESET}
${TEBAL}2. Wings${RESET}
${TEBAL}3. Update${RESET}
${TEBAL}4. Uninstall${RESET}
${TEBAL}5. Blueprint${RESET}
${TEBAL}6. Cloudflare${RESET}
${TEBAL}7. Ganti Tema${RESET}
${TEBAL}9. Info Sistem${RESET}
${TEBAL}10. Keluar${RESET}
${TEBAL}=================================${RESET}
EOF
)
    echo -e "${BIRU}${menu_content}${RESET}"
    echo -ne "${TEBAL}Masukkan pilihan [1-10]: ${RESET}"

    # Simpan menu ke file
    echo -e "$menu_content" > menu.txt
}

# Loop utama
while true; do
    tampilkan_menu
    read -r pilihan
    case $pilihan in
        1) jalankan_script "https://raw.githubusercontent.com/buszz71/DockerOS/refs/heads/main/panel.sh" ;;
        2) jalankan_script "https://raw.githubusercontent.com/buszz71/DockerOS/refs/heads/main/wings.sh" ;;
        3) jalankan_script "https://raw.githubusercontent.com/buszz71/DockerOS/refs/heads/main/update.sh" ;;
        4) jalankan_script "https://raw.githubusercontent.com/buszz71/DockerOS/refs/heads/main/uninstall.sh" ;;
        5) jalankan_script "https://raw.githubusercontent.com/buszz71/DockerOS/refs/heads/main/blueprint.sh" ;;
        6) jalankan_script "https://raw.githubusercontent.com/buszz71/DockerOS/refs/heads/main/cloudflare.sh" ;;
        7) jalankan_script "https://raw.githubusercontent.com/buszz71/DockerOS/refs/heads/main/change%20theme.sh" ;;
        9) info_sistem ;;
        10) echo "Keluar..."; exit 0 ;;
        *) echo -e "${MERAH}${TEBAL}Pilihan tidak valid!${RESET}"; read -p "Tekan Enter untuk lanjut..." ;;
    esac
done
