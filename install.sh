#!/bin/bash
set -euo pipefail

APP_DIR="/opt/myapp"
sudo mkdir -p "$APP_DIR"

JAR_FILE=$(find /tmp -type f -name "*jar-with-dependencies.jar" | head -n 1)

if [ -z "${JAR_FILE:-}" ]; then
  echo "No JAR artifact found."
  exit 1
fi

sudo cp "$JAR_FILE" "$APP_DIR/app.jar"
sudo chmod 755 "$APP_DIR/app.jar"