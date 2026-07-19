#!/bin/bash
# Inicia un servidor local para abrir la página.
# Se escucha en todas las interfaces de red (0.0.0.0) para que otros
# dispositivos de la red local tambien puedan acceder.
cd "$(dirname "$0")"
IP_LOCAL=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null || hostname -I 2>/dev/null | awk '{print $1}' || echo 'tu-ip-local')
echo "Abriendo servidor local..."
echo "  - Desde esta Mac: http://localhost:8082"
echo "  - Desde red local: http://${IP_LOCAL}:8082"
echo "Cierra esta ventana cuando termines."
python3 -m http.server 8082 --bind 0.0.0.0
