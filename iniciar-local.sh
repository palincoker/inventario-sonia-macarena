#!/bin/bash
# Inicia un servidor local para abrir la página.
# Se escucha en todas las interfaces de red (0.0.0.0) para que otros
# dispositivos de la red local tambien puedan acceder.
cd "$(dirname "$0")"

PUERTO=8082
IP_LOCAL=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null || hostname -I 2>/dev/null | awk '{print $1}' || echo 'tu-ip-local')

echo "Reiniciando servidor local si ya estaba corriendo..."
kill -9 $(lsof -t -i :${PUERTO}) 2>/dev/null || true
sleep 1

echo "Abriendo servidor local..."
echo "  - Desde esta Mac: http://localhost:${PUERTO}"
echo "  - Desde red local: http://${IP_LOCAL}:${PUERTO}"
echo "Cierra esta ventana cuando termines."

python3 -m http.server ${PUERTO} --bind 0.0.0.0
