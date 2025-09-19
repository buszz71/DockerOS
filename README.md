# 🚀 VPS & Docker OS Toolkit

## Overview

Toolkit ini berisi kumpulan command untuk build Docker image, install OS, pasang panel, tunnel Playit, dan Cloudflare token.  
Semua sudah dirapikan supaya gampang copy-paste dan cepat dipakai di VPS.

## Prerequisites

- VPS atau server dengan Docker terinstal
- Internet connectivity
- Bash shell environment
- CPU architecture: x86_64 (amd64) atau aarch64 (arm64)
- Akses akun Docker Hub (untuk push image)

## 🛠️ Installation

1. VPS OS

   **ubuntu22**
    ```sh
   wget -O Dockerfile https://raw.githubusercontent.com/manz4vps/DockerOS/main/Dockerfile:ubuntu22
    ```

   **ubuntu24**
    ```sh
   wget -O Dockerfile https://raw.githubusercontent.com/manz4vps/DockerOS/main/Dockerfile:ubuntu24
    ```
    
   **debian11**
    ```sh
   wget -O Dockerfile https://raw.githubusercontent.com/manz4vps/DockerOS/main/Dockerfile:debian11
    ```
    
   **debian12**
    ```sh
   wget -O Dockerfile https://raw.githubusercontent.com/manz4vps/DockerOS/main/Dockerfile:debian12
    ```
    
    
1. Build image yang dibutuhkan:

    ```sh
    docker build -t ubuntu22:latest .
    ```

    ```sh
    docker build -t ubuntu24:latest .
    ```

    ```sh
    docker build -t debian11:latest .
    ```

    ```sh
    docker build -t debian12:latest .
    ```


3. Push image ke Docker Hub:
   
     **Login:**
    ```sh
    docker logout
    ```
    ```sh
    docker login
    ```

   ## Tag&Push

    **ubuntu22**
    ```sh
    docker tag ubuntu22:latest manz4vps/ubuntu22:latest
    ```
    ```sh
    docker push manz4vps/ubuntu22:latest
    ```
    
    **ubuntu24**

    ```sh
    docker tag ubuntu24:latest manz4vps/ubuntu24:latest
    ```
    ```sh
    docker push manz4vps/ubuntu24:latest
    ```
    
    **debian11**
    ```sh
    docker tag debian11:latest manz4vps/debian11:latest
    ```
    ```sh
    docker push manz4vps/debian11:latest
    ```
    **debian12**
    ```sh
    docker tag debian12:latest manz4vps/debian12:latest
    ```
    ```sh
    docker push manz4vps/debian12:latest
    ```


5. Install OS di VPS:

    ```sh
    bash <(curl -s https://raw.githubusercontent.com/manz4vps/DockerOS/refs/heads/main/PilihOS-vps.sh)
    ```

    
6. Install Panel:

    ```sh
    bash <(curl -s https://raw.githubusercontent.com/manz4vps/DockerOS/refs/heads/main/all-autoinstaller.sh)
    ```

    
7. Tunnel manzsrv:
   ```sh
   sudo cloudflared service install eyJhIjoiNjkxYTIzNWIxYTFiMWYxM2E0NDdiOTUyZTUyYmVhYjUiLCJ0IjoiNDlkMTgwNWEtODc2MS00MWRiLWI1ZTYtYTEyZGJiMWQ4N2U0IiwicyI6Ik0ySXhNbUUyWm1VdE1UWXhNUzAwTWprMExXSmtOVGN0TVdNeU9HTm1PREJrT0RReCJ9
   ```
   ```Dinz
   sudo cloudflared service install eyJhIjoiNjkxYTIzNWIxYTFiMWYxM2E0NDdiOTUyZTUyYmVhYjUiLCJ0IjoiOThlNjIyNTEtNzUxNS00MjIyLWEyZTQtMzAxNWFhMzg4NmI2IiwicyI6IllqQXpOREUzWVRBdE5HSmlNeTAwTkdGaUxXSTVPVGt0TVdKaU56SXlPVEl6WW1NNSJ9
   ```


6. Install Playit Tunnel:

    **Manual:**
    ```sh
    wget https://github.com/playit-cloud/playit-agent/releases/download/v0.15.26/playit-linux-amd64
    chmod +x playit-linux-amd64
    ##runin
    ./playit-linux-amd64
    ```

    **Auto Installer:**
    ```sh
    bash <(curl -s https://raw.githubusercontent.com/manz4vps/DockerOS/refs/heads/main/playit)
    ```
7. Windows-install
   ```sh
   bash <(curl -s https://raw.githubusercontent.com/manz4vps/DockerOS/refs/heads/main/install-windows.sh)
   ```

# Supported Architectures

- OS (ubuntu24)
- OS (ubuntu22)
- OS (debian12)
- OS (debian11)
- OS (windows)

# License

This VPS & Docker OS Toolkit is released under the [MIT License](LICENSE).

# Credits

Developed and maintained by **manz4vps**  
Special thanks to the open-source community and contributors 🚀

---

**Note:** This script is intended for educationalnd experimental purposes. Use it responsibly and at your own risk.
