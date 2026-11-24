#!/bin/bash
set -e

echo "=========================================="
echo "  Installing Network Automation (OLT/MT)  "
echo "=========================================="

TMP_DIR="/tmp/olt-installer"
ARCHIVE="/tmp/olt.tar.gz"
DOWNLOAD_URL="https://github.com/bintzard/olt-automation-releases/releases/latest/download/olt-automation-v2.0-linux-x64.tar.gz"

rm -rf "$TMP_DIR" "$ARCHIVE"
mkdir -p "$TMP_DIR"

echo "[1/3] Mengunduh paket rilis terbaru..."
curl -fsSL "$DOWNLOAD_URL" -o "$ARCHIVE"

echo "[2/3] Mengekstrak paket..."
tar -xzf "$ARCHIVE" -C "$TMP_DIR"

echo "[3/3] Menjalankan installer..."
cd "$TMP_DIR"
chmod +x ./install-client.sh
./install-client.sh

rm -rf "$TMP_DIR" "$ARCHIVE"
