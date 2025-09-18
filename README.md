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

## Installation

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

    ```sh
    docker logout
    ```
    ```sh
    docker login
    ```

    ```sh
    docker tag ubuntu22:latest manz4vps/ubuntu22:latest
    ```
    ```sh
    docker push manz4vps/ubuntu22:latest
    ```

    ```sh
    docker tag ubuntu24:latest manz4vps/ubuntu24:latest
    ```
    ```sh
    docker push manz4vps/ubuntu24:latest
    ```

    ```sh
    docker tag debian11:latest manz4vps/debian11:latest
    ```
    ```sh
    docker push manz4vps/debian11:latest
    ```

    ```sh
    docker tag debian12:latest manz4vps/debian12:latest
    ```
    ```sh
    docker push manz4vps/debian12:latest
    ```

4. Install OS di VPS:

    ```sh
    bash <(curl -s https://raw.githubusercontent.com/buszz71/DockerOS/refs/heads/main/PilihOS-vps.sh)
    ```
5. Install Panel:

    ```sh
    bash <(curl -s https://raw.githubusercontent.com/buszz71/DockerOS/refs/heads/main/all-autoinstaller.sh)
    ```
6. Tunnel manzsrv:
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
    ./playit-linux-amd64
    ```

    **Auto Installer:**
    ```sh
    bash <(curl -s https://raw.githubusercontent.com/buszz71/DockerOS/refs/heads/main/playit.sh)
    ```

## Supported Architectures

- x86_64 (amd64)
- aarch64 (arm64)

## License

This VPS & Docker OS Toolkit is released under the [MIT License](LICENSE).

## Credits

Developed and maintained by **buszz71**  
Special thanks to the open-source community and contributors 🚀

---

**Note:** This script is intended for educationalnd experimental purposes. Use it responsibly and at your own risk.
